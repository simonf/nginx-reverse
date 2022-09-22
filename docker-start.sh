#!/bin/sh
/src/nginx-1.22.0/objs/nginx
cd /app
node index.js &
echo "Started"