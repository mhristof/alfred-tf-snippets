data "aws_ram_resource_share" "example" {
  name = "example"
  resource_owner = "SELF"
}

data "aws_ram_resource_share" "tag_filter" {
  name           = "MyResourceName"
  resource_owner = "SELF"

  filter {
    name   = "NameOfTag"
    values = ["exampleNameTagValue"]
  }
}
