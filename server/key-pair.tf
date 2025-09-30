resource "aws_key_pair" "ec2_instance" {
  key_name   = "ec2-instance"
  public_key = var.public_key
}
