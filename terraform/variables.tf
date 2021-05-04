variable "vpc_facts" { type = map(any) }
variable "private_subnets" { type = list(any) }
variable "public_subnets" { type = list(any) }
variable "azs" { type = list(any) }
variable "iam_role" { default = "DemoInstanceRole" }
variable "hosted_zone" { type = string }
variable "local_ip" { type = string }

variable "dev_instance_dns" {
  type = string
}

variable "tags_mgmt" {
  type = map(any)
  default = {
    Managed = "Terraform"
  }
}

# LTS version of Amazon Linux 2
variable "aws_ami_id" { 
    type = string
    default = "ami-0cf6f5c8a62fa5da6"
}
