resource "aws_instance" "my_server" {
  ami           = var.ami
  instance_type = var.instance_type

  key_name = var.key_name
  tags = {
    Name = var.tag_name
  }
  security_groups = [data.aws_security_group.ssh.name, data.aws_security_group.http.name]
  cpu_options {
    core_count = var.core_count
  }
}

data "aws_security_group" "ssh" {
  id = "sg-0df1261cfb51f4f29"
}

data "aws_security_group" "http" {
  id = "sg-0f61b9395e39fa3dd"
}
