resource "aws_key_pair" "ec2_instance" {
  key_name   = "ec2_instance"
  public_key = var.public_key
}
