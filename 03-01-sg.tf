resource "aws_security_group" "UBER-SSH-SG" {
	name = "${var.project}-SSH"
	description = "SSH access"
	vpc_id = aws_vpc.Terraform-1.id
	ingress {
		description = ""
		from_port = var.ssh_port
		to_port = var.ssh_port
		protocol = "tcp"
		cidr_blocks = [ "0.0.0.0/0" ]
		ipv6_cidr_blocks = [ "::/0" ]
	}
	egress {
		description = ""
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = [ "0.0.0.0/0" ]
		ipv6_cidr_blocks = [ "::/0" ]
	}
	tags = {
		Name = "${var.project}-SSH_Server"
		Project = var.project
	}
}

resource "aws_security_group" "UBER-WEB-SG" {
	description = "Webserver Access"
	name = "${var.project}-WEB"
	vpc_id = aws_vpc.Terraform-1.id
	ingress {
		description = ""
		from_port = var.web_port
		to_port = var.web_port
		cidr_blocks = [ "0.0.0.0/0" ]
		ipv6_cidr_blocks = [ "::/0" ]
		protocol = "tcp"
	}
	ingress {
		description = ""
		from_port = var.ssh_port
		to_port = var.ssh_port
		security_groups = [ aws_security_group.UBER-SSH-SG.id ]
		protocol = "tcp"
	}
	egress {
		description = ""
                from_port = 0
                to_port = 0
                protocol = "-1"
                cidr_blocks = [ "0.0.0.0/0" ]
                ipv6_cidr_blocks = [ "::/0" ]
        }
	tags = {
		Name = "${var.project}-WEB"
		Project = var.project
	}
}

resource "aws_security_group" "UBER-DB-SG" {
	description = "DB Access"
	vpc_id = aws_vpc.Terraform-1.id
	name = "${var.project}-DB"
	ingress {
		description = "DB"
		protocol = "tcp"
		from_port = var.db_port
		to_port = var.db_port
		security_groups = [ aws_security_group.UBER-WEB-SG.id ]
	}
	ingress {
		description = "SSH"
		protocol = "tcp"
		from_port = var.ssh_port
		to_port = var.ssh_port
		security_groups = [ aws_security_group.UBER-SSH-SG.id ]
	}
	egress {
		description = ""
                from_port = 0
                to_port = 0
                protocol = "-1"
                cidr_blocks = [ "0.0.0.0/0" ]
                ipv6_cidr_blocks = [ "::/0" ]
	}
	tags = {
		Name = "${var.project}-DB"
		Project = var.project
	}
}
