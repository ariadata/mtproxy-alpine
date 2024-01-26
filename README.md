# MTProto Proxy (Alpine) + TLS Domain Support

[![Build Status](https://files.ariadata.co/file/ariadata_logo.png)](https://ariadata.co)

![](https://img.shields.io/github/stars/ariadata/mtproxy-alpine.svg)
![](https://img.shields.io/github/watchers/ariadata/mtproxy-alpine.svg)
![](https://img.shields.io/github/forks/ariadata/mtproxy-alpine.svg)

The Telegram Messenger MTProto proxy is a zero-configuration container that automatically sets up a proxy server that speaks Telegram's native MTProto.

### This needs `dockerhost` , install from [here](https://github.com/ariadata/dockerhost-sh)

## Step 1
Clone this repository and pull the docker image
```bash
git clone --depth=1 --single-branch https://github.com/ariadata/mtproxy-alpine.git dc-mtproxy
cd dc-mtproxy
docker compose pull
```

## Step 2
Generate atleast one secret key (Use one of these commands):
```bash
# use one of these commands to generate a secret key
echo $(head -c 16 /dev/urandom | xxd -ps)

echo $(openssl rand -hex 16)

echo $(docker run --rm -v /dev/urandom:/dev/urandom:ro --entrypoint=openssl alpine/openssl rand -hex 16)

```
## Step 3
Edit `.env` file and set the secret key(s) and other variables:

## Step 4
Run the container and use bash file to generate links:
```bash
docker compose up -d

bash generate_links.sh

```

## Step 5 : Enjoy!


###  Thanks to:
* [Alex Doesh](https://github.com/alexdoesh/mtproxy)
* [Dofamin's Repo](https://github.com/Dofamin/MTProxy-Docker)
* [GetPageSpeed's Repo](https://github.com/GetPageSpeed/MTProxy)
* [seriyps's Image](https://hub.docker.com/r/seriyps/mtproto-proxy)
* [Teddysun's Repo](https://github.com/teddysun/across/blob/master/docker/v2ray/Dockerfile)
* [Abogatikov's Image](https://hub.docker.com/r/abogatikov/mtproxy-alpine)
