module "network" {
  source               = "./network"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
  private_subnet2_cidr = var.private_subnet2_cidr
}

module "compute" {
  source             = "./compute"
  vpc_id             = module.network.vpc_id
  vpc_cidr_block     = module.network.vpc_cidr_block
  private_subnet_id  = module.network.private_subnet_id
  private_subnet2_id = module.network.private_subnet2_id
  public_subnet_id   = module.network.public_subnet_id
  key_name           = var.key_name

}

data "aws_availability_zones" "available" {
  state = "available"
}