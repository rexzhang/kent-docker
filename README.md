# kent-docker

## [Kent](https://github.com/willkg/kent)

> Fake Sentry server for local development, debugging, and integration testing

## Docker

- run as nobody

## Quick Start

```shell
docker pull ghcr.io/rexzhang/kent:latest

docker run -dit --restart unless-stopped \
 -p 8000:8000 \
 --name kent ghcr.io/rexzhang/kent:latest
```
