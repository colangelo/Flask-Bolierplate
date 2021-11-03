# Flask 2 : Bolierplate app

This Flask 2 app has the following features:

- uses Flask Werkzeug webserver (not for production)
- Flask is set to run in development mode (so every change to the app.py file reloads the app)
- Flask is set to run with debug active
- has curl, netcat, ps and vi (vim-tiny) commands installed
- runs as root
- single stage build
- uses Python 3.10 Debian Bullseye Slim image (less than 140 MB)
- can be deployed to Kubernetes (with or without nginx ingress)

Reference for Flask ENV variables:

- [https://flask.palletsprojects.com/en/2.0.x/cli/]()

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

#
docker exec -it <container_id> /bin/bash
```

## Deploy to Minikube / Kubernetes

```sh
# Enable Minikube docker
eval $(minikube docker-env)

# build
export DOCKER_BUILDKIT=1
docker image build -t flask:v1 .

# create deployment and service
kubectl apply -f kubernetes/deployment.yaml -f kubernetes/service.yaml

# create nginx ingress
kubectl apply -f kubernetes/ingress.yaml

# update service to LoadBalancer (requires MetalLB on Minikube)
kubectl apply -f kubernetes/service-lb.yaml
```
