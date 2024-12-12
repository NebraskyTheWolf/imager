FROM node:18-bullseye
USER 0:0

WORKDIR /runtime

RUN mkdir /runtime/cache


COPY ./package.json /runtime/package.json
COPY ./package-lock.json /runtime/package-lock.json

RUN npm install --save \
    apt-get update -y \
    apt-get install -y imagemagick



COPY ./index.js /runtime/index.js

COPY ./public /runtime/public

CMD ["npm", "start"]

EXPOSE 3900
