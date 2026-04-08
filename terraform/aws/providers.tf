terraform {
  # The 'required_providers' block specifies which providers we need
  required_providers {
    # We're configuring the AWS provider
    aws = {
      # This tells Terraform to download the provider from HashiCorp's provider registry
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0"
}



provider "aws" {
  region = "us-east-1"
}