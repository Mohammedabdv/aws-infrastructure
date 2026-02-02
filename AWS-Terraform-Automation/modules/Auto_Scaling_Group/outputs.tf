output "launch_template" {
  value = aws_launch_template.web_lt.id
}

output "autoscaling_group" {
  value = aws_autoscaling_group.web_asg.id
}
