variable "ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0532be01f26a3de55" # Amazon Linux 2 AMI
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "web_sg" {}

variable "iam_instance_profile" {}

variable "availability_zone" {}
