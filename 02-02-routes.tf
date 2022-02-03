resource "aws_route_table" "UBER-PUBLIC-RTB" {
	vpc_id = aws_vpc.Terraform-1.id
	route  {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.UBER_IIGW.id
	}
	tags = {
		Name = "${var.project}-Public_RTB"
		Project = var.project
	}
}

resource "aws_route_table" "UBER-PRIVATE-RTB" {
	vpc_id = aws_vpc.Terraform-1.id
	route  {
		cidr_block = "0.0.0.0/0"
		nat_gateway_id = aws_nat_gateway.UBER_NAT.id
	}
	tags = {
		Name = "${var.project}-Private_RTB"
		Project = var.project
	}
}

resource "aws_route_table_association" "UBER_PUBLIC-1_Associate" {
	subnet_id = aws_subnet.UBER-Public-1.id
	route_table_id = aws_route_table.UBER-PUBLIC-RTB.id
}

resource "aws_route_table_association" "UBER_PUBLIC-2_Association" {
	subnet_id = aws_subnet.UBER-Public-2.id
	route_table_id = aws_route_table.UBER-PUBLIC-RTB.id
}

resource "aws_route_table_association" "UBER_PRIVATE-1_Association" {
	subnet_id = aws_subnet.UBER-Private-1.id
	route_table_id = aws_route_table.UBER-PRIVATE-RTB.id
}

resource "aws_route_table_association" "UBER_PRIVATE-2_Association" {
        subnet_id = aws_subnet.UBER-Private-2.id
        route_table_id = aws_route_table.UBER-PRIVATE-RTB.id
}
