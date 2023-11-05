resource "aws_security_group" "security_group" {
  name   = "${var.key_name}-Security-Group"
  vpc_id = data.aws_vpc.default_vpc.id

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type

  security_groups             = [aws_security_group.security_group.id]
  associate_public_ip_address = true
  subnet_id                   = var.subnet_id

  tags = {
    Name = "${var.key_name}-Server"
  }
}
