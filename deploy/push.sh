#/bin/bash

echo "dirname/readlink: $( dirname -- "$( readlink -f -- "$0"; )"; )"

tempdir="$( dirname -- "$( readlink -f -- "$0"; )"; )/temp"
ecrrepo="692859948557.dkr.ecr.us-east-1.amazonaws.com/awesomedev"

echo "${tempdir}"
mkdir $tempdir
cd $tempdir
git clone https://github.com/aws-ome-dev/ecr.git
git checkout main
cd ./ecr
docker build -t $ecrrepo:latest  -f ./deploy/Dockerfile .

rm -rf $tempdir

