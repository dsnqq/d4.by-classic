FROM nginx:1.25-alpine

RUN apk add --no-cache openssl

RUN mkdir -p /etc/nginx/certs && \
    openssl req -x509 -nodes -newkey rsa:2048 -days 3650 \
      -subj "/CN=d4.by/O=d4.by" \
      -keyout /etc/nginx/certs/localhost.key \
      -out /etc/nginx/certs/localhost.crt && \
    chmod 600 /etc/nginx/certs/localhost.key

COPY opencart.conf /etc/nginx/conf.d/default.conf
