#!/bin/bash
#
#  Tear down swarm
#
WORKER="kube-node1 kube-node2 kube-node3"

for THIS in $WORKER
    do
        ssh $THIS "docker swarm leave"
    done
#  Wait 10 sec for worker to leave
sleep 10
# remove nodes from master
for THIS in $WORKER
    do
        echo "remove node $THIS"
        docker node rm $THIS
        sleep 5
    done
docker swarm leave --force
