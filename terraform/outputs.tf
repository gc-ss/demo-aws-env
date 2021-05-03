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

output "dev_instance_public_ip" {
  value = aws_instance.dev_instance.public_ip
}