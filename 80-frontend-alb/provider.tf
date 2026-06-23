terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.45.0"
    }
  }
   backend "s3" {
    bucket = "remote-state-dev-86s-s3"
    key    = "roboshop-dev-frontend-alb"
    #use_lockfile = true
    region = "us-east-1"
    encrypt = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
