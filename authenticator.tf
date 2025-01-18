#Initialize Terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAUW4RBBRABN62R54T"
  secret_key = "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"
}   
