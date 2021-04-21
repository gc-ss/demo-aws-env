variable "vpc_facts" { type = map(any) }
variable "private_subnets" { type = list(any) }
variable "public_subnets" { type = list(any) }
variable "azs" { type = list(any) }
variable "iam_role" { default = "AWSCloud9SSMInstanceProfile" }

variable "tags_mgmt" {
  type = map(any)
  default = {
    Managed = "Terraform"
  }
}