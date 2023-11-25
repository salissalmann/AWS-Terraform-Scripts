//Generate Key Pair
resource "tls_private_key" "terraform_key" {
  algorithm = "RSA"
}

resource "aws_instance" "terraform_ec2" {
  ami           = var.AMIs[var.REGION]
  instance_type = "t2.micro"
  key_name      = "terraform-key"
  tags = {
    Name = "terraform_ec2"
  }
}