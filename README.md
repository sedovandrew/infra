# Infrastructure repository

## Create infrastructure with Terraform

### Initializaion Google Cloud Storage for remote backend

The modules used here:

* bucket - Create a Google Cloud Starage for storing state files.

Create storage:

1. Enter the folder `terraform/state`

2. Copy file terraform.tfvars.example to terraform.tfvars:   

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

3. Edit this file:   

   ```bash
   vim terraform.tfvars
   ```

4. Create storage:

   ```bash
   terraform apply
   ```

### Create infrastructure

The modules used here:

* app - Create a virtual machine with Ruby.
* db  - Creating a virtual machine with MongoDB. 
* vpc - Configure the firewall rule for ssh access.

Create infrastructure:

1. For stage infrastructue enter the folder `terraform/stage`, for production - `terraform/prod`

2. Copy `backend-gcs.tfvars.example` to `backend-gcs.tfvars`:

   ```bash
   cp backend-gcs.tfvars.example backend-gcs.tfvars
   ```

3. Edit `backend-gcs.tfvars`

4. Copy `terraform.tfvars.example` to `terraform.tfvars`:

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

5. Edit `terraform.tfvars`

6. Create an infrastructure:

   ```bash
   terraform apply
   ```

Done! :-)

-----

# Other methods

You should use the previous method.

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
