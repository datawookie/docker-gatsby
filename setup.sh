#!/bin/bash

CMD=$@

# By default run a development server.
#
if [ "$CMD" == "" ]
then
    CMD="develop"
fi

if ! [[ "$CMD" =~ ^(install|develop|clean|build|serve)$ ]]
then
    echo "Valid commands are: install, develop, clean, build and serve."
    exit 1
fi

case "$CMD" in
  install)
    OPTIONS=""
    ;;
  develop)
    OPTIONS="-H 0.0.0.0"
    ;;
  build)
    OPTIONS=""
    ;;
  serve)
    OPTIONS="-H 0.0.0.0"
    ;;
esac

# Install dependencies.
#
# Don't do this when serving site, otherwise will clean public/ folder.
#
if [ "$CMD" != "serve" ]
then
  yarn install
fi

# Serve site.
if [ "$CMD" != "install" ]
then
  gatsby $CMD $OPTIONS
fi
