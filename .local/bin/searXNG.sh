#!/bin/bash

cd $HOME/apps/searxng-docker/
[ "$1" = "stop" ] && docker compose down
[ "$1" = "start" ] && docker compose up -d &&
  sleep 5 && docker compose down && docker compose up -d
