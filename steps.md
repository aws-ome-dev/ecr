# Diagram

![](ecs.png)


# 1. `deploy/push.sh`
## flags

- `--ecr-url=<ecr_repo_url>` \
- `--tag=<image_tag>`

After running `deploy/push.sh` successfully, an image should be pushed to ECR. 

The output's final line will be something like: \
`image url: 692859948557.dkr.ecr.us-east-1.amazonaws.com/awesomedev:latest`

# Create a container and expose port to run the server:

`docker run -p 80:80 692859948557.dkr.ecr.us-east-1.amazonaws.com/awesomedev:latest`

for local dev, try `curl localhost:80`