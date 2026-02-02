variable "vpc_id" {
  type = string
}
variable "web_sg" {
  type    = string
  default = "Web-SG"
}
variable "alb_sg" {
  type    = string
  default = "ALB-SG"
}
