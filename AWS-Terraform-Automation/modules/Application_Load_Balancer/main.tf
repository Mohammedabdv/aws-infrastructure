resource "aws_lb_target_group" "web_tg" {
  name        = "web-target-group"
  target_type = var.target_type
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  health_check {
    interval            = 5
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 2
  }
}

resource "aws_lb_target_group_attachment" "tg_attach" {
  count            = length(var.server_ids)
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = var.server_ids[count.index]
}

resource "aws_lb" "web_alb" {
  name               = var.load_balancer_name
  internal           = false
  load_balancer_type = var.load_balancer_type
  security_groups    = [var.alb_sg]
  subnets            = var.public_subnet_ids
  tags = {
    Name = var.load_balancer_name
  }
}

# Listener for the Application Load Balancer
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.web_alb.arn # Attach this listener to the ALB
  port              = 80
  protocol          = "HTTP"

  # Default action when a request is received
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn # Send traffic to this target group
  }
}
