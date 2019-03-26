# heroku-splunk-forwarder

I want to deploy a splunk forwarder to heroku - can use the HEC event collector to store data and push to an indexer in the cloud.

## What it does so far:

* Docker image deploys to heroku
* Downloads and installs the Splunk base image, connects to a remote deployment server where future configurations can be deployed

## Configure and deploy:

* Create a new heroku app, configure it as a container registry
* In settings, configure environment variables:

|Environment Variable|Description|
|---|---|
|SPLUNK_DEPLOY_SERVER|The Deployment server you want the forwarder to connect to|
|SPLUNK_PASSWORD|Password for the forwarder login (you probably won't need login, but required nonetheless)|

* Clone this repo
* Deploy your container to heroku: https://devcenter.heroku.com/articles/container-registry-and-runtime
* Log into your Splunk Deployment server and manage apps to deploy from there
** Splunk `clientName`s are formated as `container-$(hostname)`, so you can configure serverclasses for your containers separatly

## To do:

* Pre-configure HEC settings
* Probably a lot more
