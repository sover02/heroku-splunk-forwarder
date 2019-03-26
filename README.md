# heroku-splunk-forwarder

I want to deploy a splunk forwarder to heroku - can use the HEC event collector to store data and push to an indexer in the cloud.

So far:

* Docker image deploys to heroku
* Downloads and installs the Splunk base image, connects to a remote deployment server where future configurations can be deployed
