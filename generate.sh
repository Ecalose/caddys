#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin:~/go/bin::/usr/local/go/bin; export PATH
######
# only for https://github.com/mixool/caddys/edit/master/generate.sh
#####

# tempfile & rm it when exit
trap 'rm -f "$TMPFILE"' EXIT; TMPFILE=$(mktemp) || exit 1

# go install
wget -qO $TMPFILE https://golang.org/dl/go1.15.6.linux-amd64.tar.gz
tar -zxvf $TMPFILE

# xcaddy install
URL="$(wget -qO- https://api.github.com/repos/caddyserver/xcaddy/releases/latest | grep -E "browser_download_url.*linux_amd64.tar.gz" | cut -f4 -d\")"
wget -qO $TMPFILE $URL && tar -zxvf $TMPFILE xcaddy && chmod +x xcaddy

# xcaddy build
./xcaddy build \
	--with github.com/mholt/caddy-l4 \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive
	
# clean
rm -rf go xcaddy
