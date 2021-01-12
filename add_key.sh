#!/bin/sh

# Determine key path, warning eval = evil
HOME=$(eval echo ~${SUDO_USER})
KEYCHAIN="$HOME/.ssh/authorized_keys"
GITHUB_USER="thrasyvoulos"
CURL=`which curl`
KEY="$CURL https://github.com/$GITHUB_USER.keys" 

# Append public key to keychain
echo $KEY >> $KEYCHAIN
if [[ $? -ne 0 ]]; then
    echo "Could not append key to $KEYCHAIN"
    exit 1
fi

echo "Key added!"
