#/bin/bash


echo "dirname/readlink: $( dirname -- "$( readlink -f -- "$0"; )"; )"
