# Slim image containing just hugo
FROM alpine:3.5

ENV HUGO_VERSION=0.18.1

RUN apk add --no-cache \
        curl \
    && mkdir /tmp/hugo \
    && curl -L https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
    |  tar xvzf - -C /tmp/hugo --strip-components=1 \
    && mv /tmp/hugo/hugo_${HUGO_VERSION}_linux_amd64 /usr/local/bin/hugo \
    && rm -rf /tmp/hugo

EXPOSE 1313
WORKDIR /src

CMD ["hugo"]
