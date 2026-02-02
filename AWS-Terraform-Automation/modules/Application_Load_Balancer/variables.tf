variable "vpc_id" {}

variable "target_type" {
  type    = string
  default = "instance"
}

variable "server_ids" {}

variable "load_balancer_name" {
  type    = string
  default = "web-alb"
}
variable "load_balancer_type" {
  type    = string
  default = "application"
}

variable "alb_sg" {}

variable "public_subnet_ids" {}
