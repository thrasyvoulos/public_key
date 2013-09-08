#!/bin/sh

# My public key
KEY='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEUqo4hdXCYzsZ4bUBFh00koxFL3Q8mmjzjMs3t/gD22VrJ77xVcjw9arhosMXmS5hqlUKpu1OjEVRpiVQsR+VvXI5RKpuAXPiUThWF5uNAWiHfXSlUYPKfdv3mCrcsEqvmaLgm+W/mqcAHI74/IlRH6CC9anwlvqzMO3WJzGfH2SBwKAdbCJ8V2dGDIq5CWZnGPX/3jFTGGSRsC4o4Y3ArRKSvYJPygFIK1pJj34oWviBCIhKhTOq2zGMOqwHwXmoMhq6NzFLFeqj4dkaHCJ0fQV/wuLyF/PQlev2UFNUINrrHKAUwK+Y+f6hcpAfPJ4yLRVKDKci5eXUtbfxfVIX raccoon';

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
