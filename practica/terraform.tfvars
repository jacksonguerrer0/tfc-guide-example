virginia_cidr = "10.10.0.0/16"
subnets       = ["10.10.0.0/24", "10.10.1.0/24"]
tags = {
  "env" : "dev",
  "owner" : "jack",
  "cloud" : "aws"
}
# public_subnet_cidr="10.10.0.0/24"
# private_subnet_cidr="10.10.1.0/24"
sg_ingress_cidr = "0.0.0.0/0"
ec2_specs = {
  ami           = "ami-061ad72bc140532fd"
  instance_type = "t3.micro"
}
