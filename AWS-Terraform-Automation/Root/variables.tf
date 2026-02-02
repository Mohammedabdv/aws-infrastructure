variable "region" {
  default = "us-east-1"
}

variable "availability_zone" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}
