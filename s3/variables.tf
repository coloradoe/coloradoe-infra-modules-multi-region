variable "s3" {
  type = object ({
    bucket_name = string
    environment_tag = string
})
}
