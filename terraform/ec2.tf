resource "aws_instance" "training-vault-01" {
  ami                  = var.aws_ami_id
  instance_type        = "t3.micro"
  iam_instance_profile = var.iam_role
  subnet_id            = module.demo.private_subnets[0]

  # Security Groups
  vpc_security_group_ids = ["${aws_security_group.external_access.id}"]

  tags = merge(
    var.tags_mgmt,
    {
      Name = "training-vault-01"
    }
  )
}

resource "aws_instance" "training-jenkins-01" {
  ami                  = var.aws_ami_id
  instance_type        = "t3.micro"
  iam_instance_profile = var.iam_role
  subnet_id            = module.demo.private_subnets[0]

  # Jenkins Bootstrapping
  user_data = file("helpers/jenkins_bootstrap.sh")

  # Security Groups
  vpc_security_group_ids = ["${aws_security_group.external_access.id}"]

  tags = merge(
    var.tags_mgmt,
    {
      Name = "training-jenkins-01"
    }
  )
}

resource "aws_instance" "training-prometheus-01" {
  ami                  = var.aws_ami_id
  instance_type        = "t3.micro"
  iam_instance_profile = var.iam_role
  subnet_id            = module.demo.private_subnets[0]

  # Security Groups
  vpc_security_group_ids = ["${aws_security_group.external_access.id}"]

  tags = merge(
    var.tags_mgmt,
    {
      Name = "training-prometheus-01"
    }
  )
}

resource "aws_instance" "dev_instance" {
  ami                  = var.aws_ami_id
  instance_type        = "t3.micro"
  iam_instance_profile = var.iam_role
  subnet_id            = module.demo.public_subnets[0]

  # Security Groups
  vpc_security_group_ids = ["${aws_security_group.external_access.id}"]

  tags = merge(
    var.tags_mgmt,
    {
      Name = var.dev_instance_dns
    }
  )
}

resource "aws_eip" "dev" {
  instance = aws_instance.dev_instance.id
  vpc = true

}
