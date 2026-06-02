terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.46.0"
    }
  }

  backend "s3" {
    bucket       = "bootcamp-devops-backend-terraform-kyawsawww" 
    key          = "dev/terraform.tfstate"
    region       = "ap-southeast-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = "ap-southeast-1"

  default_tags {
    tags = {
      project     = "prod"
      environment = "prod" 
      managed_by  = "terraform"
      owner       = "bootcamp"
    }
  }
}