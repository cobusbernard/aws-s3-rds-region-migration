terraform {
  backend "s3" {
    bucket  = "webinar-terraform-s3-rds"
    key     = "statefiles/s3_rds/"
    region  = "eu-west-1"
    profile = "aws-webinar"
  }
}
