#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin:~/go/bin::/usr/local/go/bin; export PATH
######

# tempfile & rm it when exit
trap 'rm -f "$TMPFILE"' EXIT; TMPFILE=$(mktemp) || exit 1

# go install
wget -O $TMPFILE https://golang.org/dl/go1.15.6.linux-amd64.tar.gz
tar -zxf $TMPFILE

# xcaddy install
URL="$(wget -qO- https://api.github.com/repos/caddyserver/xcaddy/releases/latest | grep -E "browser_download_url.*linux_amd64.tar.gz" | cut -f4 -d\")"
rm -rf /usr/bin/xcaddy
wget -O $TMPFILE $URL && tar -zxf $TMPFILE -C /usr/bin && chmod +x /usr/bin/xcaddy

# xcaddy build
xcaddy build \
    --with github.com/mholt/caddy-l4 \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive
