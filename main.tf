resource "aws_acm_certificate" "certificate" {
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "certificate_validation" {
  count           = length(var.subject_alternative_names) + 1
  name            = aws_acm_certificate.certificate.domain_validation_options[count.index].resource_record_name
  type            = aws_acm_certificate.certificate.domain_validation_options[count.index].resource_record_type
  records         = [aws_acm_certificate.certificate.domain_validation_options[count.index].resource_record_value]
  zone_id         = var.zone_id
  ttl             = var.ttl
  allow_overwrite = true
}

resource "aws_acm_certificate_validation" "certificate" {
  certificate_arn         = aws_acm_certificate.certificate.arn
  validation_record_fqdns = aws_route53_record.certificate_validation[*].fqdn
}
