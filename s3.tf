resource "aws_s3_bucket" "one" {
  bucket = "vijay.aws.moonobucket"
}

resource "aws_s3_bucket_ownership_controls" "two" {
  bucket = aws_s3_bucket.one.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "three" {
  depends_on = [aws_s3_bucket_ownership_controls.two]

  bucket = aws_s3_bucket.one.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "three" {
bucket = aws_s3_bucket.one.id
versioning_configuration {
status = "Enabled"
}
} 

ansible-config init --disabled --format ini > ansible.cfg

terraform {
backend "s3" {
region = "us-east-1"
bucket = "vijay.aws.moonobucket"
key = "prod/terraform.tfstate"
}
}




