#!/bin/bash

INSTANCES=`gcloud compute instances list | grep RUNNING`
INSTANCE_NAME=`echo $INSTANCES | cut -d " " -f1`
ZONE=`echo $INSTANCES | cut -d " " -f2`
if [ -z "$INSTANCE_NAME" ] || [ -z "$ZONE" ]
then
   echo could not find instance information, check the gcloud dashboard
   exit 1
fi

echo connecting to $INSTANCE_NAME in $ZONE

exec gcloud compute ssh --zone=$ZONE jupyter@$INSTANCE_NAME -- -L 8080:localhost:8080
