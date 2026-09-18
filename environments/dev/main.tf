terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "collective-terraform-state"
    key          = "env/dev/terraform.tfstate"
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
  my_env         = "dev"
  instance_type  = "t3.micro"
  ami-id         = "ami-01a00762f46d584a1"
  instance_count = 1
  vpc_cidr       = "10.10.0.0/16"
}
