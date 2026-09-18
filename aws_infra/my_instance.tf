# My EC2 Instance 
resource "aws_key_pair" "key" {
  key_name   = "${var.my_env}-ec2-key"
  public_key = file("C:\\Users\\MANISH\\OneDrive\\Desktop\\Terraform-aws\\multi-env-deployment-aws\\terra-key.pub")
}

resource "aws_vpc" "environment" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.my_env}-vpc"
    Environment = var.my_env
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.environment.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, 1)
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.my_env}-public-subnet"
    Environment = var.my_env
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.environment.id
  tags = {
    Name        = "${var.my_env}-igw"
    Environment = var.my_env
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.environment.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }
  tags = {
    Name        = "${var.my_env}-public-routes"
    Environment = var.my_env
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "security" {
  name        = "${var.my_env}-allow-ssh"
  description = "This SG is required to open the SSH port for the EC2 instance"
  vpc_id      = aws_vpc.environment.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "Using for SSH"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "This is for outgoing traffic"
  }

}


resource "aws_instance" "my_instance" {
  ami                    = var.ami-id
  count                  = var.instance_count
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key.key_name
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.security.id]
  tags = {
    Name = "${var.my_env}-terra-automate"
  }
}
