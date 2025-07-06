#!/bin/sh
set -e

BACKEND_URL="${REACT_APP_API_BASE_URL:-http://10.0.2.33:8080/}"

BACKEND_URL=$(echo "$BACKEND_URL" | sed 's|//*|/|g' | sed 's|http:/|http://|')

find /usr/share/nginx/html -name "*.js" -exec sed -i "s|REACT_APP_API_BASE_URL_PLACEHOLDER|$BACKEND_URL|g" {} \;

nginx -g "daemon off;"
