FROM alpine

RUN apk add --update nginx openssl openssh && \
    
COPY entrypoint.sh /entrypoint.sh

EXPOSE 30022 80 443

ENTRYPOINT sh /entrypoint.sh
