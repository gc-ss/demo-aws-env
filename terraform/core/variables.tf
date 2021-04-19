variable "availability_zones" {
    type = list(string)
    default = ["us-west-2a", "us-west-2b"]
}

variable "vpc_facts" {
    type = map
}

variable "tag_mgmt" {
    type = map

    default = {
        Managed = "Terraform"
    }

}

variable "private_subnets" {
    type = list(string)
}

variable "public_subnets" {
    type = list(string)
}