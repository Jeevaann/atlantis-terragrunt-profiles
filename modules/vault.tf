data "vault_aws_access_credentials" "creds" {
    backend = "aws"
    role    = "aws-atlantis"
    type    = "creds"
}

locals{
    access_key = data.vault_aws_access_credentials.creds.access_key
    secret_key = data.vault_aws_access_credentials.creds.secret_key
}

resource "null_resource" "local_cred" {
    access = local.access_key
    secret = local.secret_key
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
