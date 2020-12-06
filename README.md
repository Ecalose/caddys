> caddy with layer4 cloudflare-dns forwardproxy automatic updates
#### xcaddy 
```bash
xcaddy build \
    --with github.com/mholt/caddy-l4 \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive
```

#### caddy
```bash
wget -O /usr/bin/caddy https://github.com/mixool/caddys/raw/master/caddy && chmod +x /usr/bin/caddy && caddy
```
