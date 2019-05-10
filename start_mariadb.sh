#!/bin/bash
docker run -d -p 3306:3306 \
--name server \
-e MYSQL_ROOT_PASSWORD=secret \
-v /opt/mariadb:/var/lib/mysql \
--network mariadb \
rpi-mariadb.10.3 
