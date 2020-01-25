# Find a certificate that is issued
data "aws_acm_certificate" "example" {
  domain   = "tf.example.com"
  statuses = ["ISSUED"]
}

# Find a certificate issued by (not imported into) ACM
data "aws_acm_certificate" "example" {
  domain      = "tf.example.com"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}

# Find a RSA 4096 bit certificate
data "aws_acm_certificate" "example" {
  domain    = "tf.example.com"
  key_types = ["RSA_4096"]
}
