#/bin/bash


echo "dirname/readlink: $( dirname -- "$( readlink -f -- "$0"; )"; )"

tempdir="$( dirname -- "$( readlink -f -- "$0"; )"; )/temp"

echo "${tempdir}"

mkdir $tempdir
rm -rf $tempdir