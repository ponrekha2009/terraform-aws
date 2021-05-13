terraform {
  required_version = "~> 0.14.6"
  backend "s3" {
    bucket  = "palani-dev-terraform"
    key     = "terraform/dev/terraform.tfstate"
    region  = "us-east-1"
    profile = "dev"
    encrypt = true
  }
}
