#!/bin/bash

sed -i "0,/server .*/s//server ${RAILS_EXAMPLE_PORT_3000_TCP_ADDR}:${RAILS_EXAMPLE_PORT_3000_TCP_PORT};/" /config/nginx/nginx.conf
/usr/sbin/nginx -c /config/nginx/nginx.conf
