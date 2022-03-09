# Introduction 

System Information as Code aims to provide a framework to handle all the SI with code.
It will remove manually mistake and automate the deployment.
This should easier the creation of compagny, and their security

The SIaC will use packer to create the images.
Then terraform to initiate the infrastrucre instances, and finally ansible to configure those instances.


## Requirement

* Terraform
* Ansible
* Packer


## Packer images

### Scaleway

* [VPN](packers/scaleway/vpn/README.md)
