data "aws_ami" "amazon-linux-2" {
    most_recent = true
    owners = [ "amazon" ]

    filter {
        name = "name"
        values = ["*amzn2-ami-hvm*"]
    }
}

resource "aws_instance" "training-vault-01" {
    ami = data.aws_ami.amazon-linux-2.id
    instance_type = "t3.micro"
#    https://github.com/hashicorp/terraform-provider-aws/issues/4769
#    iam_instance_profile = var.iam_role
    subnet_id = module.vpc.private_subnets[0]

    tags = var.tags_mgmt
}