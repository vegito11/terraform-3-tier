environment = "development"
region      = "us-east-1"


tags = {
  environment = "development"
  team        = "devops"
  owner       = "terraform"
  dept        = "core"
}

bucket_name = "3-tier-frontend.testing.test.com"
create_s3 = true
s3_origin_id = "demo-frontend"