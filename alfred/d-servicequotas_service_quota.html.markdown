data "aws_servicequotas_service_quota" "by_quota_code" {
  quota_code   = "L-F678F1CE"
  service_code = "vpc"
}

data "aws_servicequotas_service_quota" "by_quota_name" {
  quota_name   = "VPCs per Region"
  service_code = "vpc"
}
