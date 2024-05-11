provider "aws" {
}



resource "aws_eks_cluster" "eks" {
  name     = var.eks_name
  role_arn = aws_iam_role.eks-role.arn

  vpc_config {
    subnet_ids = []
  }
}
