#!/usr/bin/env bash
######
# only for https://github.com/mixool/caddys/edit/master/generate.sh
######

go get -u github.com/caddyserver/xcaddy/cmd/xcaddy

# xcaddy build
xcaddy build \
	--with github.com/mholt/caddy-l4 \
	--with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive
