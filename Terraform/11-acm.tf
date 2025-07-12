data "aws_route53_zone" "dns_zone" {
  name         = "venkatasaicharan.com"
  private_zone = false
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "6.0.0"
  domain_name = data.aws_route53_zone.dns_zone.name
  zone_id     = data.aws_route53_zone.dns_zone.id
  subject_alternative_names = [
    "venkatasaicharan.com",
    "*.venkatasaicharan.com"
  ]
  validation_method = "DNS"
  tags = local.common_tags
}