variable "vpc_facts" { type = map(any) }
variable "private_subnets" { type = list(any) }
variable "public_subnets" { type = list(any) }
variable "azs" { type = list(any) }
variable "iam_role" { default = "DemoInstanceRole" }
variable "hosted_zone" { type = string }

variable "prefix_corp_id" {
    type = string
    sensitive = true
}

variable "local_ip" {
    type = string
    sensitive = true
}

variable "dev_instance_dns" {
  type = string
  sensitive = true
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
