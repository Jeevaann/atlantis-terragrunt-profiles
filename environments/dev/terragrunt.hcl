terraform {
  source = "git::https://github.com/Omqarrr/aws-vpc-network-terraform.git//modules/vpc"
}

data "vault_aws_access_credentials" "creds" {
    backend = "aws"
    role    = "aws-atlantis"
    type    = "creds"
}
  resource "vault_generic_secret" "example" {
    path = "secret/foo"
    data_json = jsonencode(
      {
        "foo"   = "bar",
        "pizza" = "cheese"
      }
    )
}

inputs = {
  region_name = "us-east-1"
  public_az   = ["us-east-1a", "us-east-1b"]
  private_az  = ["us-east-1a", "us-east-1b"]
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
  environment = "Testing"

}

include "root" {
  path = find_in_parent_folders()
}
