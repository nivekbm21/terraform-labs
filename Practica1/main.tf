#Proveedores
terraform {
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


# Generación de la clave criptográfica privada
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Almacenamiento de la clave privada en un archivo local
resource "local_sensitive_file" "ssh_key_file" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = "${var.key_name}.pem"
}

# Crear Bucket de s3 y subir la llave
resource "aws_s3_bucket" "secure_storage" {
  bucket = var.bucket_name
  
}

resource "aws_s3_object" "upload_key" {
  bucket = aws_s3_bucket.secure_storage.id
  key    = "${var.key_name}.pem"
  source = local_sensitive_file.ssh_key_file.filename
  depends_on = [ local_sensitive_file.ssh_key_file ]
}

# Creacion de VPC
resource "aws_vpc" "lab_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "lab-${var.student_name}"
  }
}