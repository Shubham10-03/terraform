resource "aws_s3_bucket_public_access_block" "cap-bucket-public-access" {
  bucket = aws_s3_bucket.cap-bucket.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = aws_s3_bucket.cap-bucket.bucket

  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
          {
            Sid = "PublicReadGetObject",
            Effect = "Allow",
            Principal = "*",
            Action = [
                "s3:GetObject"
            ],
            Resource = [
                "arn:aws:s3:::${var.bucket-name}-${random_id.random.dec}/*"
            ]
          }
      ]
    }
  )
  depends_on = [aws_s3_bucket_public_access_block.cap-bucket-public-access]
}

resource "aws_s3_bucket_website_configuration" "webpage-config" {
  bucket = aws_s3_bucket.cap-bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}