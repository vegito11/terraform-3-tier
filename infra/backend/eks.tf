# module "eks_cluster" {
#   source = "../../modules/eks"

#   cluster_name    = var.cluster_name
#   cluster_version = "1.27"

#   vpc_id            = module.vpc.vpc_id
#   environment       = var.environment
#   subnet_ids        = module.vpc.subnets_id
#   worker_subnet_ids = module.vpc.private_subnets_id
#   cluster_addons    = var.eks_addons 

#   cluster_endpoint_private_access      = var.cluster_endpoint_private_access
#   cluster_endpoint_public_access       = var.cluster_endpoint_public_access
#   cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs

#   cluster_enabled_log_types              = var.cluster_enabled_log_types
#   cloudwatch_log_group_retention_in_days = var.cloudwatch_log_group_retention_in_days

#   node_security_group_name = "${var.cluster_name}-nodegroup-sg"

#   cluster_security_group_additional_rules = var.cluster_security_group_additional_rules

#   eks_managed_node_groups = {

#     "${var.environment}-eks-node-group-2" = {
#       name            = "${var.environment}-eks-node-2"
#       use_name_prefix = true
#       cluster_version = 1.27
#       capacity_type   = "SPOT"
#       min_size        = var.node_min_capacity
#       max_size        = var.node_max_capacity
#       desired_size    = var.node_desired_capacity
#       instance_types  = var.node_instance_types
#       disk_size       = var.node_disk_capacity
#       labels = {
#         Name = "${var.environment}-cluster-wg-2"
#       }
#     }

#     /*"${var.environment}-eks-spot-node-group" = {
#       name            = "${var.environment}-spot"
#       capacity_type   = "SPOT"
#       use_name_prefix = true
#       min_size        = var.spot_node_min_capacity
#       max_size        = var.spot_node_max_capacity
#       desired_size    = var.spot_node_desired_capacity
#       instance_types  = var.spot_node_instance_types
#       disk_size       = var.spot_node_disk_capacity
#       labels = {
#          Name = "${var.environment}-cluster-spot-wg-1"
#          owner  = "terraform"
#        }
#     }*/

#   }

#   enable_irsa = true

#   tags = merge(
#     var.tags,
#     {}
#   )
# }