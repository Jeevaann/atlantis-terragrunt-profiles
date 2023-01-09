terraform {
  source = "git::https://github.com/Omqarrr/aws-vpc-network-terraform.git//modules/vpc"
}
inputs = {
  region_name = "us-east-1"
  public_az   = ["us-east-1a", "us-east-1b"]
  private_az  = ["us-east-1a", "us-east-1b"]
  access_key = null_resource.local_cred.access
  secret_key = null_resource.local_cred.secret
  environment = "Testing"

}

include "root" {
  path = find_in_parent_folders()
}
