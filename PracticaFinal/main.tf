module "aws-network" {
  source = "./network"

  subnet_cidr = lookup(var.subnet_cidr, terraform.workspace)
  vpc_cidr    = lookup(var.vpc_cidr, terraform.workspace)
  tags        = var.tags

}

module "virtual-machine" {
  source    = "./infra"
  ami       = lookup(var.ami, terraform.workspace)
  instancia = lookup(var.instancia, terraform.workspace)
  subnet_id = module.aws-network.subnet-id
  tags      = var.tags
  depends_on = [ module.aws-network ]
}
