resource "aws_eip" "UBER_EIP" {
	vpc = true
	tags = {
		Name = "${var.project}_EIP"
		Project = var.project
	}
}
