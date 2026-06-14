# ============================================================
# outputs.tf — Output Values
# After Terraform finishes deploying, it prints these values.
# Like a return statement — tells you what was created.
# ============================================================

output "cloudfront_url" {
  description = "Your live portfolio URL — open this in a browser!"
  value       = "https://${aws_cloudfront_distribution.portfolio.domain_name}"
}

output "quiz_url" {
  description = "Your live quiz game URL!"
  value       = "https://${aws_cloudfront_distribution.portfolio.domain_name}/quiz.html"
}

output "s3_bucket_name" {
  description = "The name of the created S3 bucket"
  value       = aws_s3_bucket.portfolio.bucket
}

output "cloudfront_distribution_id" {
  description = "CloudFront Distribution ID (useful for cache invalidation)"
  value       = aws_cloudfront_distribution.portfolio.id
}
