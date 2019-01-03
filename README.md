# telegraf-tick-k8s  
  
This repo contains relevant information for deploying tick stack on kubernetes with:    
* influxdb  
* kapacitor  
* telegraf  
* chronograf  
  
This deployment is simple and just meant to get the tick stack up and running quickly with a LB front-end  
All the persistent volumes use local storage and require about 30GB to work correctly.  
  
You'll need the following directories (on each k8s host) created if you're using local storage:  
/mnt/data  
/mnt/kap  
/mnt/chrono  
  
It's based on this deployment:  
https://vinta.ws/code/deploy-tick-stack-on-kubernetes-telegraf-influxdb-chronograf-and-kapacitor.html  
  
Deploy in the following order:  
  
kubectl create -f all the pv files  
kubectl create -f all the service files  
kubectl create -f influxdb/influx-statefulset.yaml  
kubectl create -f telegraf/telegraf-statefulset.yaml  
kubectl create -f kapacitor/kapacitor-statefulset.yaml  
kubectl create -f chronograf/chrono-statefulset.yaml  
  
connect to influxdb:  
kubectl exec -i -t influxdb-0 --namespace tick -- influx  
  
You will need to update MASTERIPADDRESS for the LoadBalancer in telegraf-service.yaml prior to use.  
# k8s-tick
