# ============================================================
# variables.tf — Input Variables
# These are the "settings" you can customise before deploying.
# Think of them like function parameters in Python.
# ============================================================

variable "aws_region" {
  description = "The AWS region where your S3 bucket will be created"
  type        = string
  default     = "eu-west-2" # London — change to eu-west-1 for Ireland, us-east-1 for N. Virginia
}

variable "bucket_name" {
  description = "The name of your S3 bucket — must be globally unique across all AWS accounts"
  type        = string
  default     = "shubh-portfolio-static-site-tf" # Add -tf so it doesn't clash with your old bucket name
}
