#!/bin/sh
MASTER=kube-master
WORKER="kube-node1 kube-node2 "

#Start swarm on master
docker swarm init
#
# wait 10 sec for manager to start
sleep 10
#
# Get the join token for Worker
WORK_TOKEN=$(docker swarm join-token --quiet worker)
echo "Join token for Worker :$WORK_TOKEN"

for THIS in $WORKER
    do
        ssh $THIS "docker swarm join --token=$WORK_TOKEN" 10.12.1.41:2377
    done

# label nodes for master
 docker node update --label-add role=dbserver kube-master 
#
# label node for workers
for THIS in $WORKER
    do
         docker node update --label-add role=dbclient $THIS
    done
