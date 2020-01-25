data "aws_route53_resolver_rule" "example" {
  domain_name = "subdomain.example.com"
  rule_type   = "SYSTEM"
}
