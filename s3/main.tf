
terraform {
  backend "s3" {}
}

locals {
  bucket_name = "${var.s3.bucket_name}-${terraform.workspace}"
}

module "log_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket                         = "logs-${terraform.workspace}"
  acl                            = "log-delivery-write"
  force_destroy                  = true
  attach_elb_log_delivery_policy = true
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = locals.bucket_name
  acl    = "private"

  versioning = {
    enabled = true
  }
  
  tags = {
    Environment = var.s3.environment_tag
  }

  # S3 bucket-level Public Access Block configuration
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  logging = {
    target_bucket = module.log_bucket.this_s3_bucket_id
    target_prefix = "log/"
  }
}
