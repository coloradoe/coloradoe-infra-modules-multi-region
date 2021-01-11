variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}
variable "environment_tag" {
  description = "The name of the current working environment"
  type        = string
}
variable "workspace" {
  description = "The name of the current workspace in the live repo"
  type        = string
}
