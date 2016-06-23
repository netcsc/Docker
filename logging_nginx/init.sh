#!/bin/bash

# generate htpasswd from environment variable
# htpasswd -b -c /etc/nginx/htpasswd admin admin

# HTPASSWD=(${USER_LIST//|/ })

# for i in "${HTPASSWD[@]}"
# do
#  HTPASSWD_USER=$(echo $i | cut -f 1 -d":")
#  HTPASSWD_PASSWORD=$(echo $i | cut -f 2 -d":")
#  htpasswd -b /etc/nginx/htpasswd $HTPASSWD_USER $HTPASSWD_PASSWORD
# done

nginx -g "daemon off;"
