#!/bin/bash

ENVIRONMENT_NOT_SET=false

if [ -z $INFRA_PROJECT ]; then
    echo Please set the environment INFRA_PROJECT
    ENVIRONMENT_NOT_SET=true
fi

if [ -z $INFRA_ZONE ]; then
    echo Please set the environment INFRA_ZONE
    ENVIRONMENT_NOT_SET=true
fi

if [ -z $INFRA_IMAGE ]; then
    echo Please set the environment INFRA_IMAGE
    ENVIRONMENT_NOT_SET=true
fi

if [ $ENVIRONMENT_NOT_SET == "true" ]; then
    exit 1
fi

gcloud compute instances create \
    --boot-disk-size=10GB \
    --image=$INFRA_IMAGE \
    --image-project=$INFRA_PROJECT \
    --machine-type=g1-small \
    --tags=puma-server \
    --restart-on-failure \
    --zone=$INFRA_ZONE \
    --metadata-from-file=startup-script=startup-script-deploy.sh \
    reddit-app-from-base
