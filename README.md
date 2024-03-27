1) Create eks cluster in the vpc that we created using terraform.
2) attached the service arn role for the same.
3) attached worker node on same that we created using terraform.
4) install kubectl on eks.

provider "aws" {
  region = "us-west-2"
}

resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster"
  role_arn = "arn:aws:iam::123456789012:role/eks-service-role"
  version  = "1.21"

  vpc_config {
    subnet_ids         = ["subnet-12345678", "subnet-23456789"] # Replace with your subnet IDs
    security_group_ids = ["sg-12345678"] # Replace with your security group ID
  }
}

output "kubeconfig" {
  value = aws_eks_cluster.my_cluster.kubeconfig
}
