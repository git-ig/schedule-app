#!/bin/sh
set -e

ROOT_DIR=/usr/share/nginx/html
PLACEHOLDER_NAME="REACT_APP_API_BASE_URL"
DEFAULT_VALUE="http://localhost:8080/"

REAL_VALUE=$(eval echo \${$PLACEHOLDER_NAME:-$DEFAULT_VALUE})

if [ -n "$REAL_VALUE" ]; then
  find ${ROOT_DIR}/static/js -type f -name '*.js' -exec sed -i "s|${PLACEHOLDER_NAME}|${REAL_VALUE}|g" {} +
fi

exec nginx -g 'daemon off;'