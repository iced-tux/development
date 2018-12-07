FROM nginx:stable-alpine

COPY nextcloud.conf /etc/nginx/conf.d/nextcloud.conf
COPY server.crt /etc/nginx/ssl/server.crt
COPY server.key /etc/nginx/ssl/server.key
COPY server.dhparam /etc/nginx/ssl/server.dhparam
