module "alb" {
  source          = "terraform-aws-modules/alb/aws"
  version         = "9.17.0"
  name            = "alb-demo"
  enable_deletion_protection = false
  vpc_id          = module.vpc-PP.vpc_id
  subnets         = module.vpc-PP.public_subnets
  security_groups = [module.alb_security_group.security_group_id]

  target_groups = {
    demo-tg = {
      name_prefix                       = "tg-"
      protocol                          = "HTTP"
      port                              = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_algorithm_type     = "weighted_random"
      load_balancing_anomaly_mitigation = "on"
      load_balancing_cross_zone_enabled = false

      target_group_health = {
        dns_failover = {
          minimum_healthy_targets_count = 2
        }
        unhealthy_state_routing = {
          minimum_healthy_targets_percentage = 50
        }
      }

      health_check = {
        enabled             = true
        interval            = 30
        path                = "/venkatasaicharan.com/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version  = "HTTP1"
      create_attachment = false # important point to remember
      tags              = local.common_tags
    }
  }

  additional_target_group_attachments = {
    for instance_key, instance_module in module.private_instance :
    instance_key => {
      target_group_key = "demo-tg"
      target_id        = instance_module.id
    }
  }

  listeners = {
    http = {
      port     = 80
      protocol = "HTTP"
      forward = {
        target_group_key = "demo-tg"
      }
    }
    https = {
        port     = 443
      protocol = "HTTPS"
      certificate_arn = module.acm.acm_certificate_arn
      forward = {
        target_group_key = "demo-tg"
      }
    }
  }

}