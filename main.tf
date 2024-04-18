terraform {
  required_providers {
    aws = {
      version = "~>5.0.0"
      source  = "hashicorp/aws"
    }
  }
}


provider "aws" {
  region = "eu-west-3"
}

module "s3-public" {
  source = "./modules/s3-public"
}

module "lambda" {
  source = "./modules/lambda"
}
