#!/bin/bash

source ./.env

# Convert TLS domain to lowercase hex string using od (available in alpine 3.6)
HEX_DOMAIN=$(printf "%s" "$TLS_DOMAIN" | od -An -tx1 | tr -d ' \n')
HEX_DOMAIN="$(echo $HEX_DOMAIN | tr '[A-Z]' '[a-z]')"

# Iterate over each secret, generating proxy links
for S in $(echo $SECRET | tr ',' '\n'); do
  PROXY_LINK1="tg://proxy?server=${DC_EXTERNAL_HOST}&port=${DC_EXTERNAL_PORT}&secret=${S}"
  PROXY_LINK2="https://t.me/proxy?server=${DC_EXTERNAL_HOST}&port=${DC_EXTERNAL_PORT}&secret=ee${S}${HEX_DOMAIN}"
  echo -e "$PROXY_LINK1\n\n$PROXY_LINK2\n\n---------------------"
done
