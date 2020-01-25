data "aws_pricing_product" "example" {
  service_code = "AmazonEC2"

  filters {
    field = "instanceType"
    value = "c5.xlarge"
  }

  filters {
    field = "operatingSystem"
    value = "Linux"
  }

  filters {
    field = "location"
    value = "US East (N. Virginia)"
  }

  filters {
    field = "preInstalledSw"
    value = "NA"
  }

  filters {
    field = "licenseModel"
    value = "No License required"
  }

  filters {
    field = "tenancy"
    value = "Shared"
  }
}

data "aws_pricing_product" "example" {
  service_code = "AmazonRedshift"

  filters {
    field = "instanceType"
    value = "ds1.xlarge"
  }

  filters {
    field = "location"
    value = "US East (N. Virginia)"
  }
}
