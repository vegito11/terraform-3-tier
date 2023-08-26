environment = "development"
region      = "us-east-1"


tags = {
  environment = "development"
  team        = "devops"
  owner       = "terraform"
  dept        = "core"
}

### ---------- 01) Networking vars ---------------
vpc_cidr = "10.0.0.0/16"
public_subnets = {
  us-east-1a = "10.0.16.0/20",
  us-east-1b = "10.0.32.0/20"
}
private_subnets = {
  us-east-1a = "10.0.80.0/20",
  us-east-1b = "10.0.96.0/20"
}

enable_dns_hostnames = true
enable_dns_support   = true
nat_enabled          = false

cluster_name                    = "development"
cluster_endpoint_private_access = true
cluster_endpoint_public_access  = true
cluster_endpoint_public_access_cidrs = [
  "11.0.0.0/16",
  "12.0.0.0/16",
  "43.204.165.131/32",  # NAT1 IP
  "43.205.18.107/32",   # NAT2 IP
  "43.205.148.126/32",  # OpenVPN IP
  "106.193.208.186/32", # Airtel
  "103.186.18.178/32",  # Jio
  "103.159.0.0/16",     # Wifi
  "14.96.113.102/32",   # Shubhu
]

## Eks Vars
cluster_enabled_log_types              = [] #["audit", "authenticator"]
cloudwatch_log_group_retention_in_days = 1

# EKS Node variables
node_desired_capacity = "1"
node_max_capacity     = "2"
node_min_capacity     = "1"
node_instance_types   = ["t3a.small"]
node_disk_capacity    = "10"

spot_node_desired_capacity = "1"
spot_node_max_capacity     = "3"
spot_node_min_capacity     = "1"
spot_node_instance_types   = ["t3a.small"]
spot_node_disk_capacity    = "10"

cluster_security_group_additional_rules = {
  vpc_igress_nodes_ephemeral_ports_tcp = {
    from_port   = "0"
    to_port     = "0"
    type        = "ingress"
    protocol    = "-1"
    description = "Allow access from Same VPC"
    cidr_blocks = ["12.0.0.0/16"]
  }
}

### ----------- 3) EKS Addons -----------------

eks_addons = {

  coredns = {
    addon_version = "v1.10.1-eksbuild.2"
  }
  kube-proxy = {
    addon_version     = "v1.27.4-eksbuild.2"
    resolve_conflicts = "resolve_conflicts_on_update"
  }
  vpc-cni = {
    addon_version = "v1.13.4-eksbuild.1"
  }
}

### ------------ 4) RDS VARS --------------------

# rds_db_username = "*************"
# rds_db_password = "*************"
app_instance_name         = "demo-db"
app_instance_class        = "db.t3.micro"
app_allocated_storage     = 10
app_max_allocated_storage = 20
app_parameter_group_name  = "demo-db-parameter-group"
app_db_name               = "demo"
app_ingress_with_cidr_blocks = [
  {
    from_port   = "5432"
    to_port     = "5432"
    protocol    = "tcp"
    description = "PostgreSQL access from within VPC"
    cidr_blocks = "10.0.0.0/16"
  },
]
is_multi_az         = false
deletion_protection = false

backup_retention_period               = 1
performance_insights_retention_period = 1
skip_final_snapshot                   = true
delete_automated_backups              = true