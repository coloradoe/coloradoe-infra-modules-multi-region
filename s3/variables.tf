variable "s3" {
  type = object ({
    bucket_name = string
    environment_tag = string
    workspace = string
})
default = ({
    bucket_name = "bucket-rdp-488-demodemodemo7328"
    environment_tag = "Test" 
    workspace = "us-east-2"
  })
}
