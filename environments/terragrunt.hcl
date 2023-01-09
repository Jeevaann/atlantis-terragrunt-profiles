# generate "backend" {
#   path      = "s3-backend.tf"
#   if_exists = "overwrite_terragrunt"
#   contents  = <<EOF
# terraform {
#     backend "s3" {
#         bucket = "terraform-multi-env-management"
#         key = "${path_relative_to_include()}/terraform.tfstate"
#         region = "us-east-1"
#         encrypt = "true"
#     }
# }
# EOF
# }

generate "versions" {
  path      = "versions.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
    terraform {
      required_providers {
            aws = {
                source  = "hashicorp/aws"
                version = "~> 4.45.0"
            }
        }
    }
    EOF
}


generate "vault" {
  path = "vault_provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "vault" {}
EOF
}


# Generate an AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
  provider "aws" {
    access_key = data.vault_aws_access_credentials.creds.access_key
    secret_key = data.vault_aws_access_credentials.creds.secret_key
    region = "us-east-1"
  }
EOF
}


    
