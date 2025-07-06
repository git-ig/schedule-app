#!/bin/sh
set -e

echo "Replacing REACT_APP_API_BASE_URL_PLACEHOLDER with http://10.0.2.33:8080/"

# change placeholder to real URL backend
find /usr/share/nginx/html -name "main.*.js" -exec sed -i "s|REACT_APP_API_BASE_URL_PLACEHOLDER|http://10.0.2.33:8080/|g" {} \;

echo "Replacement completed"

# run nginx
exec nginx -g "daemon off;"
