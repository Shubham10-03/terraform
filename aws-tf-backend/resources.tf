resource "aws_s3_bucket" "cap-bucket" {
  bucket = "${var.bucket-name}-${random_id.random.dec}"
}

resource "aws_s3_object" "PushIndexFile" {
  source       = "../static-webpage-project/index.html"
  key          = "index.html"
  bucket       = aws_s3_bucket.cap-bucket.bucket
  content_type = "text/html"
}

resource "aws_s3_object" "PushStyles" {
  source       = "../static-webpage-project/style.css"
  key          = "style.css"
  bucket       = aws_s3_bucket.cap-bucket.bucket
  content_type = "text/css"
}

resource "aws_s3_object" "PushJavaScript" {
  source       = "../static-webpage-project/script.js"
  key          = "script.js"
  bucket       = aws_s3_bucket.cap-bucket.bucket
  content_type = "application/javascript"
}

resource "random_id" "random" {
    byte_length = 1
}