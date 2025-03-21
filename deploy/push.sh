#/bin/bash


echo "dirname/readlink: $( dirname -- "$( readlink -f -- "$0"; )"; )"

tempdir="$( dirname -- "$( readlink -f -- "$0"; )"; )/temp"

echo "${tempdir}"

mkdir $tempdir
cd $tempdir
git clone https://github.com/aws-ome-dev/ecr.git
ls
cd ./ecr
ls ./deploy
docker build -f ./deploy/Dockerfile .


rm -rf $tempdir

