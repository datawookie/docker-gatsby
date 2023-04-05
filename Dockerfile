FROM node:18.13.0-slim

WORKDIR /site

COPY setup.sh /usr/bin

RUN npm install -g gatsby-cli && \
    chmod u+x /usr/bin/setup.sh

ENTRYPOINT /usr/bin/setup.sh