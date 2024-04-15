terraform {
  backend "s3" {
    bucket = "hivemind-infra-statefile"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}