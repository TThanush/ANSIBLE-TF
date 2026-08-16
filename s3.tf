resource "devops_s3_bucket" "abc" {
  bucket = "devops.aws.bucket"
}

resource "aws_s3_bucket_ownership_controls" "def" {
  bucket = devops_s3_bucket.abc.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "three" {
  depends_on = [aws_s3_bucket_ownership_controls.def]

  bucket = devops_s3_bucket.abc.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "three" {
bucket = devops_s3_bucket.abc.id
versioning_configuration {
status = "Enabled"
}
} 






