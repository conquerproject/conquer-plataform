variable "eks_iam_role_name" {
  description = "IAM Role used by EKS Control Plane"
  type        = string
  default     = "eks-controlplane"
}

variable "eks_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "tags" {
  description = "Resources tags"
  type        = map(string)
}

variable "k8s_version" {
  description = "The version of Kubernetes"
  type        = string
}
