terraform {
  backend "s3" {
    bucket = "terraformback0101"
    key    = "tfstate/sg-sample.tfstate"
    region = "us-east-1"
  }
}
