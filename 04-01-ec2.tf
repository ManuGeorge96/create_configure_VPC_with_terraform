resource "aws_instance" "UBER-SSH" {
	ami = data.aws_ami.AMI.id 
	subnet_id = aws_subnet.UBER-Public-2.id
	instance_type = var.type
	key_name = var.key
	vpc_security_group_ids = [ aws_security_group.UBER-SSH-SG.id ]
	tags = {
		Name = "${var.project}-SSH-SERVER"
		Project = var.project
	}
}

resource "aws_instance" "UBER-WEB" {
	ami = data.aws_ami.AMI.id
	subnet_id = aws_subnet.UBER-Public-1.id
	instance_type = var.type
	key_name = var.key
	vpc_security_group_ids = [ aws_security_group.UBER-WEB-SG.id ]
	tags = {
		Name = "${var.project}-WEB-SERVER"
		Project = var.project
	}
}

resource "aws_instance" "UBER-DB" {
        ami = data.aws_ami.AMI.id
	subnet_id = aws_subnet.UBER-Private-1.id
        instance_type = var.type
        key_name = var.key
        vpc_security_group_ids = [ aws_security_group.UBER-DB-SG.id ]
        tags = {
                Name = "${var.project}-DB-SERVER"
                Project = var.project
        }
}
