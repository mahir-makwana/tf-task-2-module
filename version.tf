terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.69.0"
    }
  }
  backend "s3" {
    bucket = "mahir-buket-f082324d3"
    key    = "backend.tfstat"
    region = "ap-south-1"
  }
}
