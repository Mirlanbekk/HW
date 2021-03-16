# Configure the AWS Provider
provider "aws" {
  region = var.region
}

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

data "aws_subnet" "existing_subnet" {
  id = "subnet-ee9d3488"
}

resource "aws_instance" "new_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.SG.id] 
  subnet_id = data.aws_subnet.existing_subnet.id
  key_name = var.key_name

  tags = {
    Name = "Terraform"
  }
}

resource "aws_key_pair" "master_key" {
  key_name   = var.key_name
  public_key = file(var.ssh_key_path)
  }

resource "aws_security_group" "SG" {
  vpc_id      = aws_default_vpc.default_vpc.id


  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    description = "http from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_http"
  }
}