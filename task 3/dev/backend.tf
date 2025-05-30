# This file is used to configure the backend for Terraform state management.

terraform {
  backend "s3" {
    bucket         = "newbuckfortf"
    key            = "dev/terraform.tfstate"
    region         = "eu-north-1"
  }
}
