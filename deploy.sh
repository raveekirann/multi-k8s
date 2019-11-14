docker build -t raveekirann/multi-client:latest -t raveekirann/multi-client:$SHA -f ./client/Dockerfile ./client
doeckr build -t raveekirann/multi-server:latest -t raveekirann/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t raveekirann/multi-worker:latest -t raveekirann/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push raveekirann/multi-client:latest
docker push raveekirann/multi-server:latest
docker push raveekirann/multi-worker:latest

docker push raveekirann/multi-client:$SHA
docker push raveekirann/multi-server:$SHA
docker push raveekirann/multi-worker:$SHA
kubectl apply k8s
kubectl set image deployments/server-deployment server=raveekirann/multi-server:$SHA
kubectl set image deployments/client-deployment server=raveekirann/multi-client:$SHA
kubectl set image deployments/worker-deployment server=raveekirann/multi-worker:$SHA