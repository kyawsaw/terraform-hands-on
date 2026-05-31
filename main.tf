module "vpc" {
  source           = "./modules/vpc"
  cidr_block       = var.cidr_block
  public_subnet_1  = var.public_subnet_1
  public_subnet_2  = var.public_subnet_2
  private_subnet_1 = var.private_subnet_1
  private_subnet_2 = var.private_subnet_2
}

module "ec2" {
  source                    = "./modules/ec2"
  vpc_id                    = module.vpc.vpc_id
  public_subnet_1_id        = module.vpc.public_subnet_1_id
  project_name              = var.project_name
  environment               = var.environment
  instance_type             = var.instance_type
  iam_instance_profile_name = module.iam.instance_profile_name
  depends_on = [
    module.iam
  ]
}


module "iam" {
  source                    = "./modules/iam"
  policy_name               = var.policy_name
  ec2_role_name             = var.ec2_role_name
  ec2_instance_profile_name = var.instance_profile_name
}