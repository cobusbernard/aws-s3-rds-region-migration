provider "aws" {
  version = "~> 2.0"
  region  = "eu-west-1"
  profile = "aws-webinar"
}

provider "aws" {
  alias   = "new"
  version = "~> 2.0"
  region  = "eu-central-1"
  profile = "aws-webinar"
}

provider "template" {
  version = "~> 2.1"
}