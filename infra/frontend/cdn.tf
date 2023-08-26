module "cdn" {

  source = "../../modules/cloudfront"

  bucket_name                  = var.bucket_name
  create_s3                    = var.create_s3
  s3_origin_id                 = var.s3_origin_id
  create_origin_access_control = true
  default_root_object          = "index.html"
}  