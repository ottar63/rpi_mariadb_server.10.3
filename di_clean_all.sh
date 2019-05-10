#!/bin/bash
#
#
echo "Clean up all docker images"

docker rmi $(docker images -q)

