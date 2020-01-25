data "aws_iot_endpoint" "example" {}

resource "kubernetes_pod" "agent" {
  metadata {
    name = "my-device"
  }

  spec {
    container {
      image = "gcr.io/my-project/image-name"
      name  = "image-name"

      env = [
        {
          name  = "IOT_ENDPOINT"
          value = "${data.aws_iot_endpoint.example.endpoint_address}"
        },
      ]
    }
  }
}
