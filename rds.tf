module "rds_instance" {
  source                 = "../../modules/application/rds"
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                = "mydatabase"
  username               = "admin"
  password               = "mypassword"
  vpc_security_group_ids = [module.security_group.db_sg]
  db_subnet_group_name   = "terraform-trust-subnet-group"
  backup_retention_period = 7
  # performance_insights_enabled = true

  tags = {
    Name = "terraform-lab-rds-instance"
    Env  = "dev"
  }
}