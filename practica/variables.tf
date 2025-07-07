variable "virginia_cidr" {
  description = "CIDR block for the Virginia VPC"
  type        = string
  default     = "10.10.0.0/16"
}

# variable "public_subnet_cidr" {
#   description = "CIDR block for the public subnet in Virginia"
#   type        = string
# }

# variable "private_subnet_cidr" {
#   description = "CIDR block for the private subnet in Virginia"
#   type        = string
# }

variable "subnets" {
  description = "List of subnets in the Virginia VPC"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
}


variable "sg_ingress_cidr" {
  description = "CIDR block for the security group ingress"
  type        = string
}

variable "ec2_specs" {
  description = "Specifications for the EC2 instance"
  type        = map(string)
}

variable "access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}
