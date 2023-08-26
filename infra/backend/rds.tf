module "rds" {
  source                = "../../modules/rds"
  environment           = var.environment
  vpc_id                = module.vpc.vpc_id
  db_name               = var.app_db_name
  instance_name         = var.app_instance_name
  instance_class        = var.app_instance_class
  allocated_storage     = var.app_allocated_storage
  max_allocated_storage = var.app_max_allocated_storage
  rds_user              = var.rds_db_username
  rds_password          = var.rds_db_password
  deletion_protection   = false
  # publicly_accessible = false
  is_multi_az          = var.is_multi_az
  subnet_ids           = module.vpc.private_subnets_id
  parameter_group_name = var.app_parameter_group_name
  ingress_with_cidr_blocks = var.app_ingress_with_cidr_blocks
  backup_retention_period  = var.backup_retention_period
  skip_final_snapshot      = var.skip_final_snapshot
  delete_automated_backups = var.delete_automated_backups

  tags = merge(
    var.tags,
    {
      dept = "database"
    }
  )

}
