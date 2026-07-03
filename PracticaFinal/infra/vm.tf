resource "aws_instance" "instance" {
  ami                         = var.ami
  instance_type               = var.instancia
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true

  tags = {
    owner = var.tags.owner,
    Name  = "${terraform.workspace}-vm"
  }
}
