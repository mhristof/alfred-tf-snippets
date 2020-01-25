resource "aws_iot_certificate" "cert" {
  csr    = "${file("/my/csr.pem")}"
  active = true
}

resource "aws_iot_certificate" "cert" {
  active = true
}
