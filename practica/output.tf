output "ec2_public_instance_ip" {
  value = aws_instance.public_instance_demo.public_ip
}
