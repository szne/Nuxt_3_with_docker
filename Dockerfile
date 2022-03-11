FROM node:lts-alpine

RUN mkdir src

RUN apk update && \
    apk upgrade && \
    apk add git && \
    npm install -g npm@latest nuxi nuxt3