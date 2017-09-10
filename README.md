# Infrastructure repository

## Run the application (first method)

To start the virtual machine with the application, do the following:

    $ ./create_instance.sh

## Run the application from base image (second method)

### Create a basic image for the application

Set environment variables:

    INFRA_PROJECT - project ID
    INFRA_ZONE    - zone

Create base image:

    $ cd packer
    $ packer build ubuntu16.json

### Run the application from base image

Set environment variable:

    INFRA_IMAGE - name of base image

Create virtual machine:

    $ cd ..
    $ ./create_instance_from_reddit-base.sh

## Run baked application (third method)

### Create image with application

Set environment variables:

    INFRA_PROJECT - project ID
    INFRA_ZONE    - zone

Create image:

    $ cd packer
    $ packer build immutable.json

### Run baked application from image

Set environment variable:

    INFRA_IMAGE - name of image with application

Create machine:

    $ cd ..
    $ ./create_instance_from_reddit-app.sh
