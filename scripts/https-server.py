#!/usr/bin/env python3
###############################################################################
##
##       filename: https-server.py
##    description:
##        created: 2025/04/11
##         author: ticktechman
##
###############################################################################

import os
import subprocess
import http.server
import ssl

CERT_FILE = 'cert.pem'
KEY_FILE = 'key.pem'

def generate_self_signed_cert(cert_file, key_file):
    print("->generating cert file...")
    cmd = [
        "openssl", "req", "-x509", "-newkey", "rsa:2048",
        "-keyout", key_file, "-out", cert_file,
        "-days", "365", "-nodes",
        "-subj", "/C=CN/ST=Beijing/L=Beijing/O=DevOrg/OU=Dev/CN=localhost"
    ]
    subprocess.run(cmd, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    print("->done.")

# check cert file
if not (os.path.exists(CERT_FILE) and os.path.exists(KEY_FILE)):
    generate_self_signed_cert(CERT_FILE, KEY_FILE)

# start https server
server_address = ('0.0.0.0', 4443)
httpd = http.server.HTTPServer(server_address, http.server.SimpleHTTPRequestHandler)

context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
context.load_cert_chain(certfile=CERT_FILE, keyfile=KEY_FILE)
httpd.socket = context.wrap_socket(httpd.socket, server_side=True)

print("HTTPS Server is running at https://0.0.0.0:4443")
httpd.serve_forever()

###############################################################################
