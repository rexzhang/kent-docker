# kent-docker

## [Kent](https://github.com/willkg/kent)

> Fake Sentry server for local development, debugging, and integration testing

## Docker

- run as nobody

## Quick Start

```shell
docker pull ray1ex/kent

docker run -dit --restart unless-stopped \
 -p 8000:8000 \
 --name kent ray1ex/kent
```
