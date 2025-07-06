#!/bin/sh
set -e

BACKEND_URL="${REACT_APP_API_BASE_URL:-http://10.0.2.33:8080/}"

echo "Replacing REACT_APP_API_BASE_URL_PLACEHOLDER with $BACKEND_URL"

find /usr/share/nginx/html -name "*.js" -exec sed -i "s|REACT_APP_API_BASE_URL_PLACEHOLDER|$BACKEND_URL|g" {} \;

echo "Replacement completed"
exec nginx -g "daemon off;"
