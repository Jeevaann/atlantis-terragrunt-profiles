resource "aws_security_group" "default_group" {
  name        = "${var.environment}-default-sg"
  description = "Default Secuirty Group for EKS VPC Network"
  vpc_id      = aws_vpc.eks_vpc.id
  depends_on = [
    aws_vpc.eks_vpc
  ]

  tags = {
    "Name" = "${var.environment}-default-sg"
  }
}