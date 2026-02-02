resource "aws_launch_template" "web_lt" {
  name_prefix   = "web-lt-"
  image_id      = var.ami # Amazon Linux 2
  instance_type = var.instance_type

  # Attach Security Group to instances
  vpc_security_group_ids = [
    var.web_sg
  ]

  # Attach IAM Instance Profile (for SSM)
  iam_instance_profile {
    name = var.iam_instance_profile
  }

  # User data to install and start Apache
  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "This is an app server in AWS region us-east-1" > /var/www/html/index.html
  EOF
  )

  # Tags for EC2 instances created from this template
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Web-ASG-Instance"
    }
  }
}


resource "aws_autoscaling_group" "web_asg" {
  name = var.autoscaling_group_name

  # Subnets where EC2 instances will be launched (Private subnets)
  vpc_zone_identifier = var.private_subnet_ids

  # Desired number of instances
  desired_capacity = var.desired_capacity

  # Minimum and maximum number of instances
  min_size = var.min_size
  max_size = var.max_size

  # Attach ASG to the Target Group (ALB)
  target_group_arns = [
    var.alb_target_group_arn
  ]

  # Use the Launch Template
  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  # Health check configuration
  health_check_type         = "ELB"
  health_check_grace_period = 60

  # Tags applied to EC2 instances
  tag {
    key                 = "Name"
    value               = "web-asg-instance"
    propagate_at_launch = true
  }
}
