terraform {
  backend "s3" {
    bucket         = "tf-backend-47ac32c6"
    key            = "main/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-backend-locks"
    encrypt        = true
  }
}