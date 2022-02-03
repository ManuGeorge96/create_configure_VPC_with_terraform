resource "aws_subnet" "UBER-Public-1" {
	vpc_id = aws_vpc.Terraform-1.id
	cidr_block = cidrsubnet(var.CIDR, var.subnet, 0)
	availability_zone = data.aws_availability_zones.zone-name.names[0]
	map_public_ip_on_launch = true
	tags = {
		Name = "${var.project}_Public-1"
		Project = var.project
		Env = var.envd
	}
}

resource "aws_subnet" "UBER-Public-2" {
	vpc_id = aws_vpc.Terraform-1.id
	cidr_block = cidrsubnet(var.CIDR, var.subnet, 1)
	availability_zone = data.aws_availability_zones.zone-name.names[1]
	map_public_ip_on_launch = true
	tags = {
		Name = "${var.project}_Public-2"
		Project = var.project
		Env = var.envp
	}
}

resource "aws_subnet" "UBER-Private-1" {
	vpc_id = aws_vpc.Terraform-1.id
	cidr_block = cidrsubnet(var.CIDR, var.subnet, 2)
	availability_zone = data.aws_availability_zones.zone-name.names[0]
	tags = {
		Name = "${var.project}_Private-1"
		Project = var.project
		Env = var.envd
	}
}

resource "aws_subnet" "UBER-Private-2" {
	vpc_id = aws_vpc.Terraform-1.id
	cidr_block = cidrsubnet(var.CIDR, var.subnet, 3)
	availability_zone = data.aws_availability_zones.zone-name.names[1]
	tags = {
		Name = "${var.project}_Private-2"
		Project = var.project
		Env = var.envp
	}
}
