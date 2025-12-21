
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }
  backend "s3" {
    bucket = "teste-pablo-storage3"
    key    = "terraform.tfstate"
    region = "sa-east-1"

  }
}

provider "aws" {
  region = "sa-east-1"
}
