import sys

from OpenSSL.crypto import load_certificate, load_privatekey
from OpenSSL.crypto import X509Store, X509StoreContext
from OpenSSL.SSL import Context, TLSv1_METHOD, VERIFY_PEER, VERIFY_FAIL_IF_NO_PEER_CERT, OP_NO_SSLv2
from OpenSSL.crypto import load_certificate, FILETYPE_PEM
# from six import u, b, binary_type, PY3

store = X509Store()

i = 0

for file_name in sys.argv[1:]:
  with open(file_name, "rb") as f:
    pem_data = f.read()
    cert = load_certificate(FILETYPE_PEM, pem_data)

    # cert = x509.load_pem_x509_certificate(pem_data, default_backend()) 
    # key = load_pem_private_key(pem_data, password=None,
    #                                backend=openssl_backend)
  i = i + 1
  print(i, len(sys.argv), "Came here", file_name)
  if i < len(sys.argv)-1:
    store.add_cert(cert)
  else:
   store_ctx = X509StoreContext(store, cert)
   print("Verifying certificate " + file_name)
   print(store_ctx.verify_certificate())


