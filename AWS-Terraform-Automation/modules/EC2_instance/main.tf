resource "aws_instance" "server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  count                  = length(var.private_subnet_ids)
  subnet_id              = var.private_subnet_ids[count.index]
  vpc_security_group_ids = [var.web_sg]
  iam_instance_profile   = var.iam_instance_profile

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "this is server ${count.index + 1} in region us-east-1 in AZ ${var.availability_zone[count.index]}" > /var/www/html/index.html
              EOF

  tags = {
    Name = "web_server_${count.index + 1}"
  }
}
