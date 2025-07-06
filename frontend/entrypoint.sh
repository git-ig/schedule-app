#!/bin/sh
set -e

BACKEND_URL="${REACT_APP_API_BASE_URL:-http://10.0.2.33:8080/}"

if [[ "$BACKEND_URL" != */ ]]; then
    BACKEND_URL="${BACKEND_URL}/"
fi

echo "Replacing _PLACEHOLDER with $BACKEND_URL"

find /usr/share/nginx/html -name "*.js" -exec sed -i "s|_PLACEHOLDER|$BACKEND_URL|g" {} \;

nginx -g "daemon off;"
