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
