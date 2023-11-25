resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}


//Creating security group which gives access to port 22 and 80 and allow all outbound traffic
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]    
  }

  egress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]    
  }
    
}



resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform-key"
  public_key = file("terraform-key.pub")
}

resource "aws_instance" "terraform_with_key" {
  ami           = var.AMIs[var.REGION]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.terraform_key.key_name
  tags = {
    Name = "terraform_ec2"
  }
  vpc_security_group_ids = [aws_security_group.allow_tls.id]


  /* 
  provisioner "file" {
    source      = "bashscript.sh"
    destination = "/tmp/bashscript.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/bashscript.sh",
      "sudo /tmp/bashscript.sh"
    ]
  }
  */

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "sudo systemctl start nginx"
    ]
  }

//Private key as my aws private key
  connection {
    user =  "ubuntu"
    type = "ssh"
    private_key = file("terraform-key")
    host = self.public_ip   
  }
}