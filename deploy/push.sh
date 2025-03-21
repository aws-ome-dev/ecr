#/bin/bash

# defaults
tempdir="$( dirname -- "$( readlink -f -- "$0"; )"; )/temp"
ecrrepo=""
tag=""
# overwrites
for arg in "$@"; do
    case $arg in
        --ecr-url=*)
            ecrrepo="${arg#*=}"  # Extract value after '='
            ;;
        --tag=*)
            tag="${arg#*=}"  # Extract value after '='
            ;;
        *)
            echo "Unknown argument: $arg"
            exit 1
            ;;
    esac
done

if [ -z "tag" ]; then
    echo "Error: tag is empty!"
    exit 1
fi


image="$ecrrepo:$tag"

echo "image target repo $image"

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

echo "pushed to ecr. image url: $image"
