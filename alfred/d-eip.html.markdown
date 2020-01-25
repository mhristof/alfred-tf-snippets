data "aws_eip" "by_allocation_id" {
  id = "eipalloc-12345678"
}

data "aws_eip" "by_filter" {
  filter {
    name   = "tag:Name"
    values = ["exampleNameTagValue"]
  }
}

data "aws_eip" "by_public_ip" {
  public_ip = "1.2.3.4"
}

data "aws_eip" "by_tags" {
  tags = {
    Name = "exampleNameTagValue"
  }
}
