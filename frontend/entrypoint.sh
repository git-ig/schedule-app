#!/bin/sh
set -e

find /usr/share/nginx/html -name "*.js" -exec sed -i 's|http://localhost:8080/|https://api.dock.ink/|g' {} \;

echo "Replacement completed. Starting nginx..."
exec nginx -g "daemon off;"
