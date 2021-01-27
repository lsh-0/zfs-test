#!/bin/bash
# run as root
set -euo pipefail

apt-get update

apt-get purge snapd -y

apt-get install \
    zfsutils-linux \
    -y --no-install-recommends

printf "\n \n--- this script can be found at: /root/bootstrap.sh\n \n"
