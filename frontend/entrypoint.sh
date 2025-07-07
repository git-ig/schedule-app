#!/bin/sh
set -e

URL="${REACT_APP_API_BASE_URL:-https://dock.ink/}"
case "$URL" in
  */) BACKEND_URL="$URL" ;;
  *)   BACKEND_URL="${URL}/" ;;
esac

find /usr/share/nginx/html -type f \( -name "*.js" -o -name "*.html" \) \
  -exec sed -i "s|__API_BASE_URL__|${BACKEND_URL}|g" {} +

echo "Files processed:"
find /usr/share/nginx/html -type f \( -name "*.js" -o -name "*.html" \) -exec echo "  {}" \;

exec nginx -g "daemon off;"
