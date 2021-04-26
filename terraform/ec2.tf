data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["*amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "training-vault-01" {
  ami                  = data.aws_ami.amazon-linux-2.id
  instance_type        = "t3.micro"
  iam_instance_profile = var.iam_role
  subnet_id            = module.vpc.private_subnets[0]

  tags = merge(
    var.tags_mgmt,
    {
      Name = "training-vault-01"
    }
  )
}

resource "aws_instance" "training-jenkins-01" {
  ami                  = data.aws_ami.amazon-linux-2.id
  instance_type        = "t3.micro"
  iam_instance_profile = var.iam_role
  subnet_id            = module.vpc.private_subnets[0]

  # Jenkins Bootstrapping
  user_data = file("helpers/jenkins_bootstrap.sh")

  tags = merge(
    var.tags_mgmt,
    {
      Name = "training-jenkins-01"
    }
  )
}