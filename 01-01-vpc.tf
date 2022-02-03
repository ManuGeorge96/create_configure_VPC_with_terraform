resource "aws_vpc" "Terraform-1" {
	cidr_block = var.CIDR
	enable_dns_hostnames = true
	tags = {
		Name = var.vpc_name
		Project = var.project
	}
}
