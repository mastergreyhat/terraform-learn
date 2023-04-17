provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "bucket-from-tf-aswin"
  versioning {
    enabled = true
  }
}

resource "aws_iam_user" "my_user" {
    name = "test_user_from_tf_abc"
}