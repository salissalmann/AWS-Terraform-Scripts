terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAZBN7DMGSQXMWRQHV"
  secret_key = "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"
}

resource "aws_instance" "terraform_ec2" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  key_name      = "terraform-key"
  tags = {
    Name = "terraform_ec2"
  }
}



