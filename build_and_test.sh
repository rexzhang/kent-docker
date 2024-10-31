docker container stop kent
docker container rm kent
docker image rm ray1ex/kent

docker pull python:3.13-alpine
docker build -t ray1ex/kent . --build-arg ENV=rex

docker run -dit --restart unless-stopped \
 -p 8000:8000 \
 --name kent ray1ex/kent

docker image prune -f
docker container logs -f kent
