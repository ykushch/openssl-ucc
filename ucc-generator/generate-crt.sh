#!/usr/bin/env bash

normalTextFormat=$(tput sgr0)

createCrtLocally() {
    number_of_days=$1
    openSslName="$2"
    keyName="server"
    crtName="server"
    openssl req -x509 -nodes -days ${number_of_days} -newkey rsa:2048 -keyout ${keyName}.key -extensions v3_req -out ${crtName}.crt -config ${openSslName}.cnf
    printf "\033[0;35mCertificate ${crtName} is ready ${normalTextFormat}\n"
}

showAvailableCommands() {
    echo "Script usage commands:"
    echo "Set certificate validity days: -d 365"
}

# Default parameters

# Parse arguments
while [[ $# > 0 ]]
do
key="$1"

case ${key} in
    -d|--days)
    NUMBER_OF_DAYS="$2"
    shift
    ;;
    -c|--config)
    CONFIG_OPENSSL_NAME="$2"
    shift
    ;;
    *)
    showAvailableCommands
    ;;
esac
shift
done

# Number of days for certificate
if [ -z "${NUMBER_OF_DAYS}" ]; then
    NUMBER_OF_DAYS=365
    printf "Using DEFAULT NUMBER of valid days for certificate as ${NUMBER_OF_DAYS}\n"
fi

# Path to the SSL certificate
if [ -z "${CONFIG_OPENSSL_NAME}" ]; then
    CONFIG_OPENSSL_NAME="openssl.modified"
    printf "Using DEFAULT NAME for OpenSSL certificate name as ${CONFIG_OPENSSL_NAME}\n"
fi

if [ ! -f ./${CONFIG_OPENSSL_NAME}.cnf ]; then
    printf "File ${CONFIG_OPENSSL_NAME}.cnf cannot be found locally\n"
    printf "Exiting...\n"
    exit 1
fi

createCrtLocally ${NUMBER_OF_DAYS} ${CONFIG_OPENSSL_NAME}

