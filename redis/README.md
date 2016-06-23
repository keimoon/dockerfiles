Redis image

To run:

docker volume create --name redis --label persist=true
docker run -v redis:/data/redis -P keimoon/redis:latest
