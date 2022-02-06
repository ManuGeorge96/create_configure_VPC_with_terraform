#  Script to Deploy VPC along with its subnets on AWS Cloud


## Resouces Used

- Cloud VPC :- 1
- Subnets  :- 3  ( 2- Public and 1- Private )
- Internet Gateway :- 1
- NAT Gateway  :- 1
- Elastic IP   :- 1
- Route Table  :- 2 ( Public and Private )
- Key Pair :- 1
- EC2 Instances  :- 3  ( APP, SSH. and DB )
- Security Groups :- 3  (APP, SSH, and DB )
 
## About
     
This is a Fully Automated code build with Terraform to provision EC2 instances on AWS with custom configured VPC. In this project we will be deploying 3 Instances, App, SSH, and a Database server, where Database server will be on a Private network and both APP and SSH server will be on Public Network, also the SSH access has made restricted for APP and Database server from outside network.

This script will automatically fetch the latest available Amazon Linux ami and do subneting of the IP, with the specified value mentioned for the variable <b>subnet</b> in <b>terraform.tfvars</b>.
      
## Project Outline


[<img align="center" alt="Unix" width="600" src="https://raw.githubusercontent.com/ManuGeorge96/ManuGeorge96/master/Tools/VPC.drawio.png" />][ln]

## Prerequisites

- Need an AWS account with an IAM User, having Programmatic Access.
- Needs to have Terraform Installed.

## Steps to make us of code

- git clone https://github.com/ManuGeorge96/create_configure_VPC_with_terraform.git
- cd create_configure_VPC_with_terraform
- Edit File <b>terraform.tfvars</b> with the values
- terraform init
- terraform apply

## Behind the Stage

    01-01-vpc.tf
-  Resource block named Terraform-1 which deals with VPC creation. 
-  aws_vpc  
##    
    01-02-igw.tf
-  Resource block which deals with Internet Gateway Creation.
-  aws_internet_gateway
##   
    01-03-01-eip.tf
-  Resource block which deals with Elastic IP creation which then get attched to NAT gateway on <b>01-03-natw.tf</b>.
-  aws_eip
##
    01-03-natw.tf
-  Resource block for creating NAT gateway and attaching the elastic IP to NAT gateway.
-  Nat gateway is used for resource inside Private network.
-  aws_nat_gateway
##
    02-01-subnet.tf
-  Resource block which deals with IP subneting.
-  aws_subnet
-  used <b>cidrsubnet</b> function for calculating subnets. 
##
    02-02-routes.tf
-  Resource block which deals with route table cretion and setting rules.
-  Also deals with route table subnet association.
-  aws_route_table
-  aws_route_table_association
##
    03-01-sg.tf
- Resource block which deals with Securty Group creation and for setting ingress and egress rules for EC2 instances.
- aws_security_group
##
    04-01-ec2.tf
- Resource block for EC2 Instamce creation.
- aws_instance
##
    04-02-key.tf
- Resource block which deals with Key-Pai Generation. Make use of file <b>Project.pub</b>
##
    data.tf
- Datasource block for getting the latest Amzon Linux AMI and also for fetching AZ names of mentioned region.
##
    output.tf
- Output file which returns the Private and Public IP's of the craeted Instances.
##
    provider.tf
- Provider file acting as a gateway for terrafom to AWS Cloud.
##
    terraform.tfvars
- variable file where you can update the variables like IP_CIDR, Region, Access_key, Secret_key etc.
##
    Project and Project.pub
- SSH key file used for EC2 key generation on <b>04-02-key.tf</b>
- Connect you EC2 instance with <b>Project</b>
   
[ln]: https://www.linkedin.com/in/manu-george-03453613a
