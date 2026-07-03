locals {
  filename = "test.txt"
}

module "file-module" {
  source = "./file-module"
  in-filename = local.filename
  content = "Este es el archivo #1 de"
  permission = "0400"
}

module "file-module-dos" {
  source = "./file-module"

  in-filename = "dos.txt"
  content = "Este es el archivo #2 de"
  permission = "0600"
}