#!/bin/bash

if [ ! -d "/etc/nginx/nginx.conf" ]
then
    ## does not exists, lets create
    cp /etc/nginx/nginx.conf.template /etc/nginx/nginx.conf
fi

nginx -g 'daemon off;'