module "eks_network" {
  source       = "./modules/network"
  project_name = var.project_name
  cidr_block   = var.cidr_block
  tags         = local.tags

}

module "eks_cluster" {
  source        = "./modules/cluster"
  project_name  = var.project_name
  tags          = local.tags
  subnet_pub_1a = module.eks_network.subnet_pub_1a
  subnet_pub_1b = module.eks_network.subnet_pub_1b

}