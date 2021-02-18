#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin:~/go/bin:/usr/local/go/bin; export PATH
#######
# only for https://github.com/mixool/caddys
#######

go get -u github.com/caddyserver/xcaddy/cmd/xcaddy

# xcaddy build
xcaddy build \
    --with github.com/mholt/caddy-l4 \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddyserver/forwardproxy

tar -czvf caddy.tar.gz caddy
