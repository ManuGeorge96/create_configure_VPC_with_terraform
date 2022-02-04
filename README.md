####  Script to Deploy VPC along with its subnets on AWS Cloud.
 
## About
     
This is a Fully Automated code build with Terraform to provision ec2 instances on AWS from custom configured VPC. In this project we will be deploying 3 Instances, App, SSH, and a Database server, where Database server will be on a Private network and both APP and SSH server will be on Public Network, also the SSH access has made restricted for APP and Database server from outside network.
      
## Daigram

## Prerequisites

- Need an AWS account with an IAM User, which got Programmatic Access.
- Needs to have Terraform Installed

## Behind the Stage

    01-01-vpc.tf
-     
    
