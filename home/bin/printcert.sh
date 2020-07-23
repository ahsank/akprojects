#!/bin/bash

while [[ $# -gt 0 ]]
do
		key="$1"

		case $key in
				--cafile)
						ROOTCAOPT="-CAfile $2"
						shift 2
						;;
        -h|--help)
            echo "$0 [--cafile file] cert.pem"
						exit 0
						;;
				-a|--all)
						ALL="-text"
						shift 1
						;;
				*)
						break
						;;
		esac
done
chain_pem="${1}"

if [[ ! -f "${chain_pem}" ]]; then
    echo "Usage: $0 BASE64_CERTIFICATE_CHAIN_FILE" >&2
    exit 1
fi

if ! openssl x509 -in "${chain_pem}" -noout 2>/dev/null ; then
    echo "$1 is not a certificate" >&2
    exit 1
fi
# -certopt no_subject,no_header,no_version,no_serial,no_signame,no_validity,no_subject,no_issuer,no_pubkey,no_sigdump,no_aux

awk -F'\n' '
        BEGIN {
            showcert = "openssl x509 -noout -subject -issuer -text -certopt no_serial,no_sigdump,no_pubkey,no_aux "
        }

        /-----BEGIN CERTIFICATE-----/ {
            printf "%2d: ", ind
        }

        {
            printf $0"\n" | showcert
        }

        /-----END CERTIFICATE-----/ {
            close(showcert)
            ind ++
        }
    ' "${chain_pem}"

echo
openssl verify $ROOTCAOPT -untrusted "${chain_pem}" "${chain_pem}"

