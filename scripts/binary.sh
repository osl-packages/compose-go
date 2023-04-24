#!/bin/bash

PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd .. && pwd )"
COMPOSE_DIR=$PROJECT_DIR/build/compose

# Update local compose
if [ -e $COMPOSE_DIR ]
    then rm -rf $COMPOSE_DIR
fi
git clone https://github.com/docker/compose $COMPOSE_DIR

# Check if Docker Engine is installed
DOCKER_VERSION=$(docker --version)
if [ -n "$DOCKER_VERSION" ]; then
  echo "🐳 Docker installed"
else
  echo "⛔ Docker Engine not found, please install Docker"
  echo "https://docs.docker.com/engine/install/"
  exit 1
fi

# Create binary / Update if exists
cd $COMPOSE_DIR \
    && make binary \
    && cp -f $COMPOSE_DIR/bin/build/docker-compose $PROJECT_DIR/src/compose \
    && rm -rf $COMPOSE_DIR
