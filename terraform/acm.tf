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

output "training-vault-01-domain-validation" {
  value = aws_acm_certificate.training-vault-01.domain_validation_options
}

output "training-vault-01-domain-validation-status" {
  value = aws_acm_certificate.training-vault-01.status
}

output "training-jenkins-01-domain-validation" {
  value = aws_acm_certificate.training-jenkins-01.domain_validation_options
}

output "training-jenkins-01-domain-validation-status" {
  value = aws_acm_certificate.training-jenkins-01.status
}