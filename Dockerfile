FROM nginxinc/nginx-unprivileged:stable-alpine

USER root
RUN apk add --no-cache openssl \
 && rm -f /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY 40-htpasswd.sh /docker-entrypoint.d/40-htpasswd.sh
COPY site/ /usr/share/nginx/html/

RUN chmod 755 /docker-entrypoint.d/40-htpasswd.sh \
 && chmod -R a+rX /usr/share/nginx/html

USER 101
EXPOSE 8080
