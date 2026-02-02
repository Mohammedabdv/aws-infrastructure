output "server_ids" {
  value = aws_instance.server[*].id
}

output "server_private_ips" {
  value = aws_instance.server[*].private_ip
}

output "ami" {
  value = var.ami
}