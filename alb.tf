module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "rachit-tf-alb-nodejs"

  load_balancer_type = "application"

  vpc_id          = "vpc-036d31bd5fc70a5ef"
  subnets         = ["subnet-00c76418a9e98912e", "subnet-020fdf655e136d4b6"]
  security_groups = ["sg-03ad3ca0551511d2c"]

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        my_target = {
          target_id = "i-0e70f36efb344b975"
          port      = 80
        }
      }
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = "arn:aws:acm:us-east-2:421320058418:certificate/32cada0f-2629-4090-a2ac-a6b61b9c4eb5"
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]
}
