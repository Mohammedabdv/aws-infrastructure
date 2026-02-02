provider "aws" {
  region = var.region
}

module "vpc" {
  source            = "../modules/VPC"
  availability_zone = var.availability_zone
}

module "security" {
  source = "../modules/Security"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source               = "../modules/EC2_instance"
  web_sg               = module.security.web_sg
  private_subnet_ids   = module.vpc.private_subnet_ids
  iam_instance_profile = module.security.iam_instance_profile
  availability_zone    = var.availability_zone
}

module "alb" {
  source            = "../modules/Application_Load_Balancer"
  server_ids        = module.ec2.server_ids
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg            = module.security.alb_sg
}

module "asg" {
  source               = "../modules/Auto_Scaling_Group"
  alb_target_group_arn = module.alb.alb_target_group_arn
  private_subnet_ids   = module.vpc.private_subnet_ids
  web_sg               = module.security.web_sg
  iam_instance_profile = module.security.iam_instance_profile
}
