module "k8s-servers" {
  source        = "../k8s"
  count         = 3
  ami           = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"

  key_name = "ec2_instance"
  core_count = 2
  tag_name = count.index==0 ? "k8s_master" : "k8s_worker_${count.index}"
}


