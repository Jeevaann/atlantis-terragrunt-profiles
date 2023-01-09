terraform {
  source = "git::https://github.com/Omqarrr/aws-vpc-network-terraform.git//modules/vpc"
}
inputs = {
  region_name = "us-east-1"
  public_az   = ["us-east-1a", "us-east-1b"]
  private_az  = ["us-east-1a", "us-east-1b"]
  environment = "Testing"
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key

}

include {
  path = find_in_parent_folders()
}
