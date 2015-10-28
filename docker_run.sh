#!/bin/bash

docker build -t ventrilo $(dirname $0)
ID=$(docker run -d --name=ventrilo -p 3784:3784 -p 3784:3784/udp ventrilo)

echo
echo
echo Started vent in docker with container id $ID
