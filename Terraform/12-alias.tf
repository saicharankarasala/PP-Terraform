resource "aws_route53_record" "alias_record" {
  zone_id = data.aws_route53_zone.dns_zone.zone_id
  name    = "app.venkatasaicharan.com"
  type    = "A"

  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = true
  }
}