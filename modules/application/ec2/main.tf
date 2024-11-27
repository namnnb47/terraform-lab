# create key pem

resource "tls_private_key" "key" {
  algorithm = "RSA"
}


resource "aws_key_pair" "bastion_key_pair" {
  key_name   = "terraform-lab-key"
  public_key = tls_private_key.key.public_key_openssh
}

resource "local_sensitive_file" "private_key" {
  filename        = "/Users/namnnb/Documents/dxg/terraform-lab-repo-namnnb/terraform/envs/dev/terraform-lab-key.pem"
  content         = tls_private_key.key.private_key_pem
  file_permission = "0400"
}

resource "aws_instance" "terraform-lab-server" {
  count                       = var.instance_count
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_1_id
  associate_public_ip_address = false
  security_groups             = [var.private_sg]
  tags = {
    Name = "terraform-lab-server-${count.index}"
  }
}

resource "aws_instance" "bastion" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_1_id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.bastion_key_pair.key_name
  security_groups             = [var.public_sg]
  tags = {
    Name = "terraform-lab-bastion"
  }
}



