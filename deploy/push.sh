#/bin/bash

# defaults
tempdir="$( dirname -- "$( readlink -f -- "$0"; )"; )/temp"
ecrrepo="692859948557.dkr.ecr.us-east-1.amazonaws.com/awesomedev"

# overwrites
while getopts f:t:c: flag; do
    case "${flag}" in
        e) ecrrepo=${OPTARG} ;;
    esac
done

image="$ecrrepo:latest"

echo "dirname/readlink: $( dirname -- "$( readlink -f -- "$0"; )"; )"

echo "${tempdir}"
mkdir $tempdir
cd $tempdir
git clone https://github.com/aws-ome-dev/ecr.git
git checkout main
cd ./ecr

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ecrrepo

docker build -t $image  -f ./deploy/Dockerfile .
docker push $image
rm -rf $tempdir

echo "image url: $image"
