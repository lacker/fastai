#!/bin/bash

# Create an instance

IMAGE_FAMILY="pytorch-latest-gpu"
INSTANCE_NAME="my-fastai-instance"
INSTANCE_TYPE="n1-highmem-8"
ZONE="us-west1-b"

# Control whether we have a preemptible instance
FLAGS="--preemptible"

gcloud compute instances create $INSTANCE_NAME \
        --image-family=$IMAGE_FAMILY \
        --image-project=deeplearning-platform-release \
        --maintenance-policy=TERMINATE \
        --accelerator="type=nvidia-tesla-p100,count=1" \
        --machine-type=$INSTANCE_TYPE \
        --boot-disk-size=200GB \
        --metadata="install-nvidia-driver=True" \
	--zone=$ZONE \
        $FLAGS
