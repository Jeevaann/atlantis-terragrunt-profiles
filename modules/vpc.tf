resource "aws_vpc" "eks_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  #   instance_tenancy = "default"

  tags = {
    Name = "${var.environment}-vpc"
  }
}
