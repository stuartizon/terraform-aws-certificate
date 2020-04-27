output "arn" {
  value       = aws_acm_certificate_validation.certificate.certificate_arn
  description = "The ARN of the validated certificate"
}
