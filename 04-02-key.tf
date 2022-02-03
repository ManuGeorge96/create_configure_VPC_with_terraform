resource "aws_key_pair" "Project" {
	key_name = var.key
	public_key = file("Project.pub")
}
