data "aws_eks_cluster" "example" {
  name = "example"
}

data "aws_eks_cluster_auth" "example" {
  name = "example"
}

provider "kubernetes" {
  host                   = "${data.aws_eks_cluster.example.endpoint}"
  cluster_ca_certificate = "${base64decode(data.aws_eks_cluster.example.certificate_authority.0.data)}"
  token                  = "${data.aws_eks_cluster_auth.example.token}"
  load_config_file       = false
}
