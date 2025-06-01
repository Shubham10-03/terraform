output "s3_bucket_name" {
  value = aws_s3_bucket.cap-bucket.bucket
}

output "website_url" {
  value = aws_s3_bucket.cap-bucket.bucket_domain_name
}