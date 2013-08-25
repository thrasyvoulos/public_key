#!/bin/sh

# My public key
KEY='ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwQIsKhcHSGbHCZneCsIlCehlQ/wqB4AoHV91l5uHydorifyW8DF27slHJchwqVZdESr1qmmB4uMmGTJX6WBwxnt3fGjtsJJgpJnyh2bVlOT+iU8o9GFt83iqyAsaMiS/Opi8L0rxbglKtiafAQ4Z/k+L+AerRuJYieXIXxifT+qjHoWYEruZXzeSvn/gBJ7C7EebPLqJQUnwfYm+4Wbu58lbwyWgRbewjiSw/MeqzEA8Od+OEKvXQtFODD90noVehhAhYmHuPcyOsxPSyuF9v5ALCb000+ckkNJdhqwpWpTtH8Y5JfvRXo8DlmTVKPZ6a0n1RnjnarX0LKPwJF2m6Q== pmoust@Panagiotis-Moustafelloss-MacBook-Pro.local';

# Determine key path, warning eval = evil
HOME=$(eval echo ~${SUDO_USER})
KEYCHAIN="$HOME/.ssh/authorized_keys"

# Append public key to keychain
echo $KEY >> $KEYCHAIN
if [[ $? -ne 0 ]]; then
    echo "Could not append key to $KEYCHAIN"
    exit 1
fi

echo "Key added!"
