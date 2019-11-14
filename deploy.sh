docker build -t raveekirann/multi-client:latest -t raveekirann/multi-client:$SHA -f ./client/Dockerfile ./client
doeckr build -t raveekirann/multi-server:latest -t raveekirann/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t raveekirann/multi-worker:latest -t raveekirann/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push raveekirann/multi-client
docker push raveekirann/multi-server
docker push raveekirann/multi-worker
kubectl apply k8s
kubectl set image deployments/server-deployment server=raveekirann/multi-server:latest
