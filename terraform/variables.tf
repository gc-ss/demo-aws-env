variable "vpc_facts" { type = map }
variable "private_subnets" { type = list }
variable "public_subnets" { type = list }
variable "azs" { type = list }
variable "iam_role" { default = "AWSCloud9SSMAccessRole" }

variable "tags_mgmt" {
    type = map
    default = {
        Managed = "Terraform"
    }
}