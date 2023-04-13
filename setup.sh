#!/bin/bash

CMD=$@

# By default tun a development server.
#
if [ "$CMD" == "" ]
then
    CMD="develop"
fi

if ! [[ "$CMD" =~ ^(develop|build)$ ]]
then
    echo "Valid commands are: develop, build."
    exit 1
fi

case "$CMD" in
  develop)
    OPTIONS="-H 0.0.0.0"
    ;;
  build)
    OPTIONS=""
    ;;
esac

# Install dependencies.
yarn install
# Serve site.
gatsby $CMD $OPTIONS