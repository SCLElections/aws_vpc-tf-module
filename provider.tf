provider "aws" {
  profile = "${var.aws_profile}"
  region  = "${var.region}"
  alias   = "aws.local"
}
