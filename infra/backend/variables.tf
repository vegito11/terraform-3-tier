variable "enable_dns_hostnames" {
  description = "Should be true if you want to use private DNS within the VPC"
  default     = false
}

variable "enable_dns_support" {
  description = "Should be true if you want to use private DNS within the VPC"
  default     = false
}

variable "environment" {
  description = "The Deployment environment"
}


variable "project" {
  type        = string
  description = "Project Name Tag"
  default     = "demo"
}

variable "public_subnets" {
  description = "A map of availability zones to public cidrs"
  type        = map(string)
  default = {
    us-east-1a = "",
    us-east-1b = ""
  }
}

variable "private_subnets" {
  description = "A map of availability zones to private cidrs"
  type        = map(string)
  default = {
    us-east-1a = "",
    us-east-1b = ""
  }
}

variable "region" {
  description = "The region to launch the bastion host"
}

variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

variable "eks_cluster_name" {
  description = "A eks cluster name to set subnet specific tags"
  type        = string
  default     = "testing"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "nat_enabled" {
  type    = bool
  default = false
}

/* ========================= EKS Cluster Variables */

################################################################################
# Control Plane
################################################################################

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_additional_security_group_ids" {
  description = "additional externally created security group IDs to attach to the cluster control plane"
  type        = list(string)
  default     = []
}


variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled"
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled"
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "enable_irsa" {
  description = "Determines whether to create an OpenID Connect Provider for EKS to enable IRSA"
  type        = bool
  default     = true
}

variable "cluster_enabled_log_types" {
  description = "A list of the desired control plane logs to enable. For more information, see Amazon EKS Control Plane Logging documentation (https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html)"
  type        = list(string)
  default     = ["audit", "api", "authenticator"]
}

variable "cloudwatch_log_group_retention_in_days" {
  description = "Number of days to retain log events. Default retention - 90 days"
  type        = number
  default     = 7
}

################################################################################
# Cluster Security Group
################################################################################


variable "cluster_security_group_additional_rules" {
  description = "List of additional security group rules to add to the cluster security group  created. Set `source_node_security_group = true` inside rules  to set the `node_security_group` as source"
  type        = any
  default     = {}
}

################################################################################
# EKS Managed Node Group
################################################################################

variable "eks_managed_node_groups" {
  description = "Map of EKS managed node group definitions to create"
  type        = any
  default     = {}
}

# EKS Node variables
variable "node_disk_capacity" {
  description = "provide node disk size"
  type        = string
  default     = "100"

}

variable "node_desired_capacity" {
  description = "provide node desired capacity"
  type        = string
  default     = "1"
}

variable "node_max_capacity" {
  description = "provide node max capacity"
  type        = string
  default     = "2"
}

variable "node_min_capacity" {
  description = "provide node min capacity"
  type        = string
  default     = "1"
}

variable "node_instance_types" {
  description = "provide array of instance types"
  type        = list(string)
  default     = ["m5.large"]

}

# Spot Node variables
variable "spot_node_disk_capacity" {
  description = "provide node disk size"
  type        = string

}

variable "spot_node_desired_capacity" {
  description = "provide node asg desired capacity"
  type        = string
}

variable "spot_node_max_capacity" {
  description = "provide node asg max capacity"
  type        = string
}

variable "spot_node_min_capacity" {
  description = "provide node asg min capacity"
  type        = string
}

variable "spot_node_instance_types" {
  description = "provide array of instance types"
  type        = list(string)

}

################################################################################
# Node Security Group
################################################################################

variable "node_security_group_id" {
  description = "ID of an existing security group to attach to the node groups created"
  type        = string
  default     = ""
}

variable "node_security_group_name" {
  description = "Name to use on node security group created"
  type        = string
  default     = null
}

variable "node_security_group_additional_rules" {
  description = "List of additional security group rules to add to the node security group created. Set `source_cluster_security_group = true` inside rules to set the `cluster_security_group` as source"
  type        = any
  default     = {}
}

variable "eks_managed_node_group_defaults" {
  description = "Map of EKS managed node group default configurations"
  type        = any
  default     = {}
}

/*  EKS Addons  */

variable "eks_addons" {

  description = "Map of cluster addon configurations to enable for the cluster. Addon name can be the map keys or set with `name`"
  type        = any

  default = {
    coredns = {
      addon_version = "v1.10.1-eksbuild.2"
    }
    kube-proxy = {
      addon_version = "v1.27.4-eksbuild.2"
    }
    vpc-cni = {
      addon_version = "v1.13.4-eksbuild.1"
    }
  }
}

variable "rds_db_username" {
  description = "app Database username"
  type        = string
  sensitive   = true
  default     = "core"
}

variable "rds_db_password" {
  description = "app Database password"
  type        = string
  sensitive   = true
  default     = "core$%890"
}

variable "app_ingress_with_cidr_blocks" {
  description = "List of ingress rules to create where cidr_blocks is used"
  type        = list(map(string))
  default     = []
}

variable "deletion_protection" {
  description = "Deletion protection for RDS"
  type        = bool
}

variable "app_instance_name" {
  description = "app DB Instance Name"
  type        = string
  default     = ""
}

variable "app_db_name" {
  description = "app DB Name"
  type        = string
  default     = ""
}

variable "app_instance_class" {
  description = "app DB Instance Class"
  type        = string
  default     = ""
}

variable "app_allocated_storage" {
  description = "app DB Allocated Storage"
  type        = number
  default     = 20
}

variable "app_max_allocated_storage" {
  description = "app DB Max Allocated Storage"
  type        = number
  default     = 1000
}

variable "app_parameter_group_name" {
  description = "app DB RDS Parameter Group"
  type        = string
  default     = ""
}

variable "is_multi_az" {
  description = "Multi Availability Zone"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "Number of days to keep backups"
  type        = number
  default     = 30
}

variable "performance_insights_retention_period" {
  description = "Retention period of performance Insights"
  type        = number
  default     = 7
}

variable "skip_final_snapshot" {
  description = "Skip the creation of the final database snapshot on destroy"
  type        = bool
  default     = true
}

variable "delete_automated_backups" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted"
  type        = bool
  default     = false
}
