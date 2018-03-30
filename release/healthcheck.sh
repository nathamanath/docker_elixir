#!/bin/bash

set -euo pipefail

if [ "$(/opt/$APP_NAME/bin/$APP_NAME ping)" == "pong" ]
then
  exit 0
fi

exit 1
