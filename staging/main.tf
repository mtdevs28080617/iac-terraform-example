module "vpc" {
  source      = "../modules/vpc"
  cidr_prefix = local.vpc_cidr_prefix
  customer    = local.customer
  environment = local.environment
  region      = local.region
}