resource "aws_acm_certificate" "training-vault-01" {
  domain_name       = "vault.${var.hosted_zone}"
  validation_method = "DNS"

  tags = var.tags_mgmt
}

resource "aws_acm_certificate" "training-jenkins-01" {
  domain_name       = "jenkins.${var.hosted_zone}"
  validation_method = "DNS"

  tags = var.tags_mgmt
}
