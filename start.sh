#!/bin/sh

yarn build
cp -a build/. /usr/share/nginx/html/
nginx -g 'daemon off;'