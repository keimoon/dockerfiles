Redis image

To run:

docker volume create --name redis --label persist=true
docker run -v redis:/data/redis keimoon/redis:latest
