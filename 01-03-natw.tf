resource "aws_nat_gateway" "UBER_NAT" {
	allocation_id = aws_eip.UBER_EIP.id
	subnet_id = aws_subnet.UBER-Public-1.id
	tags = {
		Name = "${var.project}_NAT"
		Project = var.project
	}
}	
