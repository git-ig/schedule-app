#!/bin/sh
set -e

find /usr/share/nginx/html -name "*.js" -exec sed -i 's|REACT_APP_API_BASE_URL|https://api.dock.ink/|g' {} \;

echo "Replacement completed. Starting nginx..."
exec nginx -g "daemon off;"
