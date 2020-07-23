#!/usr/bin/python

import requests
import argparse
import sys
import os
import logging

# curl -H 'Content-Type: application/json' \
# -d '{"host_name": "piab1-pkicontroller1-1-piab.eng.sfdc.net", "kingdom_name": "piab", "san":
# ["piab1-pkica1-1-piab.eng.sfdc.net", "localhost"]}' \
# --tlsv1.2 --cacert /etc/pki_service/ca/security-ca.pem \
# --cert /etc/pki_service/pkisvc/client/certificates/client.pem \
# --key /etc/pki_service/pkisvc/client/keys/client-key.pem \
# https://piab1-pkicontroller1-1-piab.eng.sfdc.net:8443/sfdc/v1/server/token

def main():
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument('-H', '--header', help="HTTP Header")
    arg_parser.add_argument("-v", "--verbose", help="increase output verbosity", action="store_true")
    arg_parser.add_argument("-d", "--data", help="data")
    arg_parser.add_argument("--cacert", help="cacert")
    arg_parser.add_argument("--cert", help="cert")
    arg_parser.add_argument("--key", help="key")
    arg_parser.add_argument("--tlsv1.2", help="Use tlsv1.2", action="store_true")
    arg_parser.add_argument("url")
    try:
        args = arg_parser.parse_args()
    except:
        print "---"
        arg_parser.print_help()
        exit()

    if args.verbose:
        logging.basicConfig(level=logging.DEBUG)
        verbose = True
    else:
        logging.basicConfig(level=logging.INFO)

    reqargs = dict()
    header = None
    data = None
    header = dict()

    if args.header:
        splitHeader = args.header.split(": ")
        header[splitHeader[0]] = splitHeader[1]
    if args.data: data = args.data
    if data == "@-": data = sys.stdin.read()
    if args.cacert: reqargs['verify'] = args.cacert
    if args.cert: reqargs['cert'] = (args.cert, args.key)
    if header: reqargs['headers'] = header
    if args.data:
        resp = requests.post(args.url, data, **reqargs)
    else:
        resp = requests.get(args.url, **reqargs)

    print(resp.content)

if __name__ == "__main__":

    main()    
