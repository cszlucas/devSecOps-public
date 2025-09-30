resource "aws_instance" "my_server" {
  ami           = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"

  key_name = "ec2-instance"
  tags = {
    Name = "ec2_server"
  }
  security_groups = [aws_security_group.ssh.name, aws_security_group.http.name, aws_security_group.custom.name]
  depends_on      = [aws_key_pair.ec2_instance]
}

output "ec2_public_ip" {
  value = aws_instance.my_server.public_ip
}


resource "aws_security_group" "ssh" {
  name        = "allow-ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-0bf481b36918b11c2"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
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

resource "aws_security_group" "http" {
  name        = "allow-http"
  description = "Allow http inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0bf481b36918b11c2"

  ingress {
    description = "SSH"
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
    Name = "allow_http"
  }
}

resource "aws_security_group" "custom" {
  name        = "allow-custom"
  description = "Allow custom inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0bf481b36918b11c2"

  ingress {
    description = "Custom"
    from_port   = 3000
    to_port     = 3000
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
    Name = "allow_custom"
  }
}
