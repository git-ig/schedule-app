#!/bin/sh
set -e

URL="${REACT_APP_API_BASE_URL:-http://10.0.2.33:8080/}"
case "$URL" in
  */) BACKEND_URL="$URL" ;;
  *)   BACKEND_URL="${URL}/" ;;
esac

echo "Replacing __API_BASE_URL__ with ${BACKEND_URL}"

find /usr/share/nginx/html -type f \( -name "*.js" -o -name "*.html" \) \
  -exec sed -i "s|__API_BASE_URL__|${BACKEND_URL}|g" {} +

echo "Replacement completed"
echo "Files processed:"
find /usr/share/nginx/html -type f \( -name "*.js" -o -name "*.html" \) -exec echo "  {}" \;

exec nginx -g "daemon off;"
