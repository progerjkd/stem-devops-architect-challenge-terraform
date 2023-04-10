terraform {
  backend "s3" {
    bucket         = "terraform-stem-state-prod"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-stem-state-prod"
  }
}
