output "DB-Private-IP" {
	value = aws_instance.UBER-DB.private_ip
}
output "WEB-Public-IP" {
	value = aws_instance.UBER-WEB.public_ip
}
output "WEB-Private-IP" {
	value = aws_instance.UBER-WEB.private_ip
}
output "SSH-Public-IP" {
	value = aws_instance.UBER-SSH.public_ip
}
