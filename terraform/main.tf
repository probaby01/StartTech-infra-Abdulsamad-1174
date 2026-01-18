# Networking Module
module "networking" {
  source = "./modules/networking"

  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

# Storage Module
module "storage" {
  source = "./modules/storage"

  project_name = var.project_name
  environment  = var.environment
}

# Compute Module
module "compute" {
  source = "./modules/compute"

  project_name      = var.project_name
  vpc_id            = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnet_ids
  instance_type     = var.instance_type

  depends_on = [module.networking]
}

# Cache Module
module "cache" {
  source = "./modules/cache"

  project_name           = var.project_name
  vpc_id                 = module.networking.vpc_id
  private_subnet_ids     = module.networking.private_subnet_ids
  ec2_security_group_id  = module.compute.ec2_security_group_id

  depends_on = [module.networking, module.compute]
}

# Monitoring Module
module "monitoring" {
  source = "./modules/monitoring"

  project_name = var.project_name
  instance_id  = module.compute.instance_id

  depends_on = [module.compute]
}