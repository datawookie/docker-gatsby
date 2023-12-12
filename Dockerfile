FROM node:21.3.0-slim

RUN apt-get update && \
    apt-get install -y git curl procps && \
    git config --global --add safe.directory /site && \
    npm install -g gatsby-cli vercel netlify-cli

WORKDIR /site

# Put this into separate layer so that changes in setup.sh don't cause NPM install.
COPY setup.sh /usr/bin
RUN chmod u+x /usr/bin/setup.sh

ENTRYPOINT ["/usr/bin/setup.sh"]
