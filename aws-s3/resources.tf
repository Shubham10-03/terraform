resource "aws_s3_bucket" "cap-bucket" {
  bucket = "${var.bucket-name}-${random_id.random.dec}"
}

resource "aws_s3_object" "PushAccountDataObject" {
  source = "../.Credentials.secret"
  key = "AWS-account-secret.data"
  bucket = aws_s3_bucket.cap-bucket.bucket
}

resource "random_id" "random" {
    byte_length = 1
}