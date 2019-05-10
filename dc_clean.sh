#!/bin/bash
#
#  
echo "Cleaning all docker conainers"
docker rm $(docker ps -a -q)
