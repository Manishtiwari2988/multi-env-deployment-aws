terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "collective-terraform-state"
    key          = "env/prd/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "app" {
  source         = "../../aws_infra"
  my_env         = "prd"
  instance_type  = "t3.large"
  ami-id         = "ami-01a00762f46d584a1"
  instance_count = 3
  vpc_cidr       = "10.30.0.0/16"
}
