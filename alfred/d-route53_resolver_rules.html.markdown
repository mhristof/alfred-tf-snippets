data "aws_route53_resolver_rules" "example" {
  tags = {
    Environment = "dev"
  }
}
