resource "aws_acm_certificate" "roboshop" {
  domain_name       = "*.${var.domain_name}"
  validation_method = "DNS"

  tags = {

    Nmae = "${local.common_name}"
    project = var.project
    environment = var.environment
    Terraform = true

  }
  lifecycle {
    create_before_destroy = true
  }
}

## for validation of the certificate, we need to create a DNS(CNAME) record in the hosted zone

resource "aws_route53_record" "roboshop" {
  for_each = {
    for dvo in aws_acm_certificate.roboshop.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 1
  type            = each.value.type
  zone_id         = var.zone_id
}

resource "aws_acm_certificate_validation" "roboshop" {
  certificate_arn         = aws_acm_certificate.roboshop.arn
  validation_record_fqdns = [for record in aws_route53_record.roboshop : record.fqdn]
}