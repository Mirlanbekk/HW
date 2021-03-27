 variable  "allocated_storage" {}

variable "engine" {}
variable "engine_version" {}
variable "instance_class" {}
variable "multi_az" {}
  
variable "name" {}
variable "username" {}
#   password                = random_password.password.result
variable "password" {}
variable "port" {}
variable "publicly_accessible" {} 
variable "storage_encrypted" {}
variable "storage_type" {}
variable "vpc_security_group_ids" {}
variable "subnetgroup" {}
variable "vpc_id" {}
variable "cidr_block_private_subnet1" {}
variable "cidr_block_private_subnet2" {}
variable "prefix" {}
variable "region" {}
variable "ssh_key_path" {}
variable "rds_port" {}
variable "cidr_block_public_subnet" {}
variable "security_group_db" {}
