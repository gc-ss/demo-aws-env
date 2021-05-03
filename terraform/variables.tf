variable "vpc_facts" { type = map(any) }
variable "private_subnets" { type = list(any) }
variable "public_subnets" { type = list(any) }
variable "azs" { type = list(any) }
variable "iam_role" { default = "DemoInstanceRole" }
variable "hosted_zone" { type = string }
variable "local_ip" { type = string }
variable "private_hz" { type = string }

variable "dev_instance_dns" {
  type = string
}

variable "tags_mgmt" {
  type = map(any)
  default = {
    Managed = "Terraform"
  }
}