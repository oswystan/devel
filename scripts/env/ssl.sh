###############################################################################
##
##       filename: ssl.sh
##    description:
##        created: 2025/04/17
##         author: ticktechman
##
###############################################################################

alias ssl.crt.cat='openssl x509 -noout -text -in '
alias ssl.cert.cat='openssl x509 -noout -text -in '
alias ssl.csr.cat='openssl req -noout -text -in '
alias ssl.key.rsa.cat='openssl rsa -noout -text -in '
alias ssl.key.ec.cat='openssl ec -noout -text -in '

function ssl.cert.RSA-SHA256() {
  [[ $# -ne 1 ]] && { echo "usage: $0 <domain-name>"; return 1; }
  local CN="$1"
  openssl req -x509 -newkey rsa -sha256 -keyout server.key -out server.crt -days 365 -nodes -subj "/CN=${CN}"
}
function ssl.cert.RSA-SHA384() {
  [[ $# -ne 1 ]] && { echo "usage: $0 <domain-name>"; return 1; }
  local CN="$1"
  openssl req -x509 -newkey rsa -sha384 -keyout server.key -out server.crt -days 365 -nodes -subj "/CN=${CN}"
}
function ssl.cert.ECDSA-SHA256() {
  [[ $# -ne 1 ]] && { echo "usage: $0 <domain-name>"; return 1; }
  local CN="$1"
  openssl req -x509 \
  -newkey ec \
  -pkeyopt ec_paramgen_curve:P-256 \
  -keyout server.key \
  -out server.crt \
  -sha256 \
  -days 365 \
  -nodes \
  -subj "/CN=${CN}"
}
function ssl.cert.ECDSA-SHA384() {
  [[ $# -ne 1 ]] && { echo "usage: $0 <domain-name>"; return 1; }
  local CN="$1"
  openssl req -x509 \
  -newkey ec \
  -pkeyopt ec_paramgen_curve:P-256 \
  -keyout server.key \
  -out server.crt \
  -sha384 \
  -days 365 \
  -nodes \
  -subj "/CN=${CN}"
}

###############################################################################
