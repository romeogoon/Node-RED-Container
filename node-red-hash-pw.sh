#!/bin/sh

################################################################################
# Author: Olarn Sukasem
#
# Description: Generate a hash
#
################################################################################

# Login to root then cd to directory "/home/rock/Documents/Projects/node-red"
MYPWD=${PWD}

# Create and change permission
docker exec -d -it node-red /bin/sh -c "mkdir /usr/src/node-red/opt && chmod 755 /usr/src/node-red/opt"

# Copy hash-pw.sh to container
docker cp "${MYPWD}"/hash-pw.sh node-red:/usr/src/node-red/opt

# Change permission and execute hash-pw.sh with input parameter
result=$(docker exec -it node-red /bin/sh -c "chmod 755 /usr/src/node-red/opt/hash-pw.sh && /usr/src/node-red/opt/hash-pw.sh "$1"")
echo "${result}";