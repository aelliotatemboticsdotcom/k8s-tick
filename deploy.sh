#!/bin/bash
# deploys everything in order
# run as root or with elevated privileges: i.e. sudo ./deploy.sh

mkdir -p /mnt/data
mkdir -p /mnt/kap
mkdir -p /mnt/chrono
chmod 777 /mnt/*

# create the namespace
kubectl create namespace tick

# create the persistent volumes
kubectl create -f influxdb/influxpv.yaml 
kubectl create -f kapacitor/kappv.yaml
kubectl create -f chronograf/chronopv.yaml

# create the services
kubectl create -f influxdb/influx-service.yaml
kubectl create -f kapacitor/kapacitor-service.yaml
kubectl create -f chronograf/chrono-service.yaml

# create the apps
kubectl create -f influxdb/influxdb-statefulset.yaml
sleep 30
kubectl create -f telegraf/telegraf-daemonset.yaml
sleep 15
kubectl create -f telegraf/telegraf-deployment.yaml
sleep 15
kubectl create -f kapacitor/kapacitor-statefulset.yaml
sleep 30
kubectl create -f chronograf/chrono-statefulset.yaml
