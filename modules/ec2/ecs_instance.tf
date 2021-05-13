data "aws_ami" "amazon_linux_v2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20210326.0-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"]
}

data "aws_subnet" "primary_dmz_subnet" {
  filter {
    name   = "name"
    values = ["primary_dmz_subnet_*"]
  }
}

data "aws_security_group" "allow_all_sg" {
  name = "allow_all"
}

resource "aws_instance" "jump_host" {
  ami                         = data.aws_ami.amazon_linux_v2.id
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.palani_aws_ssh_keypair.key_name
  subnet_id                   = data.aws_subnet.primary_dmz_subnet.id
  vpc_security_group_ids      = [data.aws_security_group.allow_all_sg.id]
  tags = {
    Name        = "palani_jump_host"
    Environment = var.environment
  }
}