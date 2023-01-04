terraform {
  source = "git::https://github.com/Omqarrr/aws-vpc-network-terraform.git//modules/vpc"
}

inputs = {
  region_name = "ap-south-1" #mumbai-region
  profile = "psl-aws"
  public_az   = ["ap-south-1a", "ap-south-1b"]
  private_az  = ["ap-south-1a", "ap-south-1b"]
  environment = "Develop"
}

include "root" {
  path = find_in_parent_folders()
}
