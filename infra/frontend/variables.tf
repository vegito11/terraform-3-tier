variable "bucket_name" {
  type        = string
  description = "S3 bucket names"
}

variable "create_s3" {
  type        = bool
  description = "Whether to create the S3 bucket"
}

variable "s3_origin_id" {
  type        = string
  description = ""
}

variable "environment" {
  description = "The Deployment environment"
}

variable "region" {
  description = "The region to launch the bastion host"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "default_root_object" {
  description = "The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL."
  type        = string
  default     = null
}


variable "default_cache" {
  description = "Configuration for default cache behavior"
  type = object({
    min_ttl                = number
    default_ttl            = number
    max_ttl                = number
    cached_methods         = list(string)
    allowed_methods        = list(string)
    viewer_protocol_policy = string
  })
  default = {
    min_ttl                = 0
    default_ttl            = 360
    max_ttl                = 8640
    cached_methods         = ["GET", "HEAD"]
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    viewer_protocol_policy = "redirect-to-https"
  }
}