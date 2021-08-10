#!/bin/bash

packer build manifest11.json
terraform init
terraform plan
terraform apply -input=false -auto-approve
