output "ip_publica_output" {
  value = module.virtual-machine.ip_publica
}
output "instance-id-output" {
  value = module.virtual-machine.instance-id
}

output "tags-name-instance-output" {
  value = module.virtual-machine.tags-name
}

output "availability-zone-output" {
  value = module.virtual-machine.availability-zone
}

output "vpc-id-output" {
  value = module.aws-network.vpc-id
}

output "subnet-id-output" {
  value = module.aws-network.subnet-id
}

output "tags-owner-subnet" {
  value = var.tags.owner
}
