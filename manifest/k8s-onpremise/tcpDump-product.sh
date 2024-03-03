#!/bin/bash

# dapetin nama pod product
POD_NAME=$(kubectl get pods -l app=products -n core -o jsonpath={.items..metadata.name} | cut -d ' ' -f1)

echo "tunggu 1-2 menit untuk prosess pull image" 

# debug container dengan tcpdump
kubectl debug -q -i $POD_NAME -n core --image=nicolaka/netshoot -- \
    tcpdump -i eth0 -A -s0 'tcp port 8080 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)'
