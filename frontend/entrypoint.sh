#!/bin/sh
set -e

find /usr/share/nginx/html -name "*.js" -exec sed -i 's|__API_BASE_URL__|https://api.dock.ink/|g' {} \;

echo "Replacement completed. Starting nginx..."
exec nginx -g "daemon off;"
