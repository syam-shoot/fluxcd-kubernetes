#!/bin/bash

while true; do \
  curl --write-out '%{http_code}\n' -s -i --output /dev/null "192.168.22.103"; \
  sleep .$RANDOM; done