# Create a test Flask app

## Test the app

```sh
# Create pipenv virtualenv
pipenv install -r requirements.txt

# enter the virtualenv
#pipenv shell

# run the app in the virtualenv
pipenv run python app.py

# test
http localhost:8000

```

## Build container and run in Docker

```sh
#
export DOCKER_BUILDKIT=1
docker image build -t flask:v1 .

#
docker run -d -p 8000:8000 flask:v1

```

## Deploy to Minikube / Kubernetes

```sh
# Enable Minikube docker
eval $(minikube docker-env)

# build
export DOCKER_BUILDKIT=1
docker image build -t flask:v1 .

# create deployment and service
kubectl apply -f kubernetes/deploy-svc.yaml

# create nginx ingress
kubectl apply -f kubernetes/ingress.yaml

# update service to LoadBalancer (requires MetalLB on Minikube)
kubectl apply -f kubernetes/service-lb.yaml

```
