terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "collective-terraform-state"
    key          = "env/stg/terraform.tfstate"
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
  my_env         = "stg"
  instance_type  = "t2.medium"
  ami-id         = "ami-01a00762f46d584a1"
  instance_count = 2
  vpc_cidr       = "10.20.0.0/16"
}
