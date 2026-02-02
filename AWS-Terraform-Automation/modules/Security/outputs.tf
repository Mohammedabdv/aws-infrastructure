output "iam_instance_profile" {
  value = aws_iam_instance_profile.ec2_profile.name
}

output "web_sg" {
  value = aws_security_group.web_sg.id
}

output "alb_sg" {
  value = aws_security_group.alb_sg.id
}
