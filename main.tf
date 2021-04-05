terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.35.0"
    }
  }
}

provider "aws" {
  # Configuration options (note: not specified b/c using default credential information)
  region = "us-east-2"
}

# note that "CI/CD Config" is only an identifier for terraform
resource "aws_ami_copy" "instance1" {
  name              = "CI/CD Copy"
  description       = "Testing out a copy of CI/CD EC2 server using terraform"
  source_ami_id     = "i-01937a1a3fa3cd3f9"
  source_ami_region = "us-east-2"

  tags = {
    Name = "copy"
  }
}