resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type_name
  key_name="jenkins"
  vpc_security_group_ids = [aws_security_group.aws_sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "ec2-server"
  }
}
resource "aws_ecr_repository" "example" {
  name                 = "deockr_ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
resource "aws_security_group" "aws_sg" {
  name = "security group from terraform"

  ingress {
    description = "SSH from the internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "80 from the internet"
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

}