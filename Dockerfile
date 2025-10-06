# ---- Build stage ----
FROM hugomods/hugo:exts AS builder
WORKDIR /src
COPY . /src
RUN hugo --minify

# ---- Serve stage ----
FROM caddy:alpine
# Caddy serves static files from /usr/share/caddy on port 80 by default
COPY --from=builder /src/public /usr/share/caddy
