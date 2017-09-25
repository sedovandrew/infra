# Infrastructure repository

* [Create infrastructure with Terraform](#create-infrastructure-with-terraform)
  * [Initializaion Google Cloud Storage for remote backend](#initializaion-google-cloud-storage-for-remote-backend)
  * [Create infrastructure](#create-infrastructure)
* [Create basic images with Packer](#create-basic-images-with-packer)
  * [Image with MongoDB](#image-with-mongodb)
  * [Image with Ruby](#image-with-ruby)
* [Configuration instances with Ansible](#configuration-instances-with-ansible)
  * [Configuration dynamic inventory](#configuration-dynamic-inventory)
  * [Check configuration](#check-configuration)
  * [Apply configuration](#apply-configuration)

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

## Create basic images with Packer

Because Terraform manages the firewall rule for the ssh connection, create
infrastructure using Terraform before starting the preparation of images using Packer.

### Image with MongoDB

You can create a basic image with MongoDB like this:

```bash
packer build packer/db.json
```

### Image with Ruby

Image with Ruby for application:

```bash
packer build packer/app.json
```

## Configuration instances with Ansible

Ansible is used to configure virtual machines.

### Configuration dynamic inventory

Install the package as specified [here](http://docs.ansible.com/ansible/latest/guide_gce.html#introduction):

```bash
pip install apache-libcloud
```

Copy example file with configuration:

```bash
cd ansible/inventory
cp secrets.py.example secrets.py
```

Edit `secrets.py` with this documentation:

* [Credentials](http://docs.ansible.com/ansible/latest/guide_gce.html#credentials)
* [Configuring Modules with secrets.py](http://docs.ansible.com/ansible/latest/guide_gce.html#configuring-modules-with-secrets-py)

### Check configuration

```bash
cd ansible
ansible-playbook reddit_app.yml --limit reddit-db --tags db-tag --check
ansible-playbook reddit_app.yml --limit reddit-app --tags app-tag --check
```

### Apply configuration

You can do it this way:

```bash
cd ansible
ansible-playbook reddit_app.yml --limit reddit-db --tags db-tag
ansible-playbook reddit_app.yml --limit reddit-app --tags app-tag
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
