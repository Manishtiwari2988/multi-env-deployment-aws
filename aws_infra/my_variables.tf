variable "my_env" {
  description = " This is the Environment for Infra"
  type        = string
}

variable "ami-id" {
  description = "This is the AMI Id for EC2"
  type        = string
}

variable "instance_type" {
  description = "This is the instance type for EC2"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the environment VPC"
  type        = string
}

variable "instance_count" {
  description = "Count for EC2"
  type        = number
}