variable "ami" {
  type        = string
  default     = "ami-0532be01f26a3de55" # Amazon Linux 2 AMI
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
}

variable "web_sg" {}

variable "iam_instance_profile" {}

variable "autoscaling_group_name" {
  type    = string
  default = "Web-ASG"
}

variable "private_subnet_ids" {}

variable "alb_target_group_arn" {}

variable "desired_capacity" {
  type    = number
  default = 4
}

variable "min_size" {
  type    = number
  default = 2
}

variable "max_size" {
  type    = number
  default = 6
}
