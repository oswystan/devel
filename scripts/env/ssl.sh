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
alias ssl.ciphers='openssl ciphers -v 'ALL:@SECLEVEL=1''

function ssl.cert.RSA-SHA256() {
  [[ $# -ne 1 ]] && {
    echo "usage: $0 <domain-name>"
    return 1
  }
  local CN="$1"
  openssl req -x509 \
    -newkey rsa \
    -sha256 \
    -keyout server.key \
    -out server.crt \
    -days 365 \
    -nodes \
    -subj "/CN=${CN}"
}
function ssl.cert.RSA-SHA384() {
  [[ $# -ne 1 ]] && {
    echo "usage: $0 <domain-name>"
    return 1
  }
  local CN="$1"
  openssl req -x509 \
    -newkey rsa \
    -sha384 \
    -keyout server.key \
    -out server.crt \
    -days 365 \
    -nodes \
    -subj "/CN=${CN}"
}
function ssl.cert.ECDSA-SHA256() {
  [[ $# -ne 1 ]] && {
    echo "usage: $0 <domain-name>"
    return 1
  }
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
  [[ $# -ne 1 ]] && {
    echo "usage: $0 <domain-name>"
    return 1
  }
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

function ssl.site.ciphersuite() {
  [[ $# -lt 1 ]] && {
    echo "usage: $0 <URL1> ..."
    return 1
  }
  for one in "$@"; do
    local val="$(curl -v --tls-max 1.2 "https://$one" 2>&1 | grep 'SSL connection using' | cut -d'/' -f 2)"
    printf "%32s: $one\n" "$val"
  done
}
function ssl.site.tls() {
  [[ $# -lt 1 ]] && {
    echo "usage: $0 <URL1> ..."
    return 1
  }
  for one in "$@"; do
    local val="$(curl -v "https://$one" 2>&1 | grep 'SSL connection using' | cut -d'/' -f1-2 | cut -d' ' -f5-)"
    printf "%-42s: $one\n" "$val"
  done
}
function ssl.site.ca() {
  [[ $# -lt 1 ]] && {
    echo "usage: $0 <URL1> ..."
    return 1
  }
  for one in "$@"; do
    local val="$(curl -svI "https://$one" 2>&1 | grep 'issuer' | cut -d';' -f2 | cut -d'=' -f2)"
    printf "%-32s: $one\n" "$val"
  done
}

function ssl.ocsp.url() {
  [[ $# -ne 1 ]] && {
    echo "usage: $0 <cert-file>"
    return 1
  }
  openssl x509 -in "$1" -noout -ocsp_uri
}
function ssl.ocsp() {
  [[ $# -ne 2 ]] && {
    echo "usage: $0 <cert-file> <chain-file>"
    return 1
  }
  local url="$(ssl.ocsp.url "$1")"
  openssl ocsp \
    -issuer "$2" \
    -cert "$1" \
    -url "$url" \
    -resp_text \
    -noverify
}

###############################################################################
