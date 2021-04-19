module "vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = var.vpc_facts.name
    cidr = var.vpc_facts.cidr

    azs             = ["us-west-2a", "us-west-2b"]
    private_subnets = var.private_subnets
    public_subnets  = var.public_subnets

    enable_nat_gateway = true
    enable_vpn_gateway = false

    tags = var.tag_mgmt
}