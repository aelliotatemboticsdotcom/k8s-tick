#!/bin/bash
# deletess everything in order

# delete the apps
kubectl delete -f influxdb/influxdb-statefulset.yaml
kubectl delete -f telegraf/telegraf-daemonset.yaml
kubectl delete -f telegraf/telegraf-deployment.yaml
kubectl delete -f kapacitor/kapacitor-statefulset.yaml
kubectl delete -f chronograf/chrono-statefulset.yaml

# delete the services
kubectl delete -f influxdb/influx-service.yaml
kubectl delete -f kapacitor/kapacitor-service.yaml
kubectl delete -f chronograf/chrono-service.yaml

# delete the persistent volumes
kubectl delete -f influxdb/influxpv.yaml
kubectl delete -f kapacitor/kappv.yaml
kubectl delete -f chronograf/chronopv.yaml
