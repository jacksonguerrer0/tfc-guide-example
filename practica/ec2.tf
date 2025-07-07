resource "aws_instance" "public_instance_demo" {
  ami           = var.ec2_specs.ami
  instance_type = var.ec2_specs.instance_type
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = data.aws_key_pair.myKey.key_name
  security_groups = [aws_security_group.mySecurityGroup.id]
  user_data = file("userData.sh")

  provisioner "local-exec" {
    command = "echo ${self.public_ip} NORMAL > result.txt"
  }

  provisioner "local-exec" {
    when   = create
    command = "echo ${self.public_ip} CREATE >> result.txt"
  }

  provisioner "local-exec" {
    when   = destroy
    command = "echo ${self.public_ip} DESTROY >> result.txt"
  }
}
