resource "aws_internet_gateway" "UBER_IIGW" {
	vpc_id = aws_vpc.Terraform-1.id
	tags = {
		Name = "${var.project}_IGW_NEW"
		Project = var.project
	}
	lifecycle {
		create_before_destroy = true
	}
}
