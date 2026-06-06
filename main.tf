#vpc group module
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
}

#security group module
module "security_group" {
  source = "./modules/security-groups"

  vpc_id = module.vpc.vpc_id
}

#ec2 instance module
module "ec2" {

  source = "./modules/ec2"

  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.security_group.security_group_id

  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
}