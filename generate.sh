#!/usr/bin/env bash
# PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin:~/go/bin:/usr/local/go/bin; export PATH
######
# only for https://github.com/mixool/caddys
######

go get -u github.com/caddyserver/xcaddy/cmd/xcaddy

# xcaddy build
xcaddy build latest \
    --with github.com/mholt/caddy-l4 \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-webdav \
    --with github.com/caddyserver/forwardproxy@caddy2
    --output ./caddy-amd64
export GOOS=linux GOARCH=arm64
xcaddy build latest \
    --with github.com/mholt/caddy-l4 \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-webdav \
    --with github.com/caddyserver/forwardproxy@caddy2
    --output ./caddy-arm64
