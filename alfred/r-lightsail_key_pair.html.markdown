# Create a new Lightsail Key Pair
resource "aws_lightsail_key_pair" "lg_key_pair" {
  name = "lg_key_pair"
}

resource "aws_lightsail_key_pair" "lg_key_pair" {
  name    = "lg_key_pair"
  pgp_key = "keybase:keybaseusername"
}

resource "aws_lightsail_key_pair" "lg_key_pair" {
  name       = "importing"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
