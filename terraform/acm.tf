resource "aws_acm_certificate" "training-vault-01" {
    domain_name = "${var.domain}.${var.hosted_zone}"
    validation_method = "DNS"

    tags = var.tags_mgmt
}

output "training-vault-01-domain-validation" {
    value = aws_acm_certificate.training-vault-01.domain_validation_options
}

output "training-vault-01-domain-validation-status" {
    value = aws_acm_certificate.training-vault-01.status
}