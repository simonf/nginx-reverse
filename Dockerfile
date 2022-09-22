FROM alpine
RUN apk add nginx nodejs npm
RUN apk add --update alpine-sdk
RUN apk add pcre pcre-dev gzip zlib zlib-dev openssl-dev curl
RUN mkdir /src
WORKDIR /src
RUN wget https://nginx.org/download/nginx-1.22.0.tar.gz
RUN tar zxf nginx*.gz
WORKDIR /src/nginx-1.22.0
RUN ["./configure", "--with-http_ssl_module", "--with-http_sub_module"]
RUN ["make"]
RUN mkdir -p /usr/local/nginx/logs && mkdir -p /usr/local/nginx/conf
RUN cp /etc/nginx/nginx.conf /usr/local/nginx/conf
RUN mkdir /app
WORKDIR /app
COPY index.js .
COPY docker-start.sh .
COPY default.conf /etc/nginx/http.d/default.conf
CMD ["/app/docker-start.sh", "&"]