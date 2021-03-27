module "vpc" {
    source = "./VPC"

    cidr_block_vpc                      = var.cidr_block_vpc    
    prefix                              = var.prefix
    region                              = var.region
    cidr_block_public_subnet            = var.cidr_block_public_subnet
    instance_tenancy                    = var.instance_tenancy
    cidr_block_route                    = var.cidr_block_route

}


module "EC2" {
    source = "./EC2"


key_name                            = var.key_name
ssh_key_path                        = var.ssh_key_path
ami                                 = var.ami
instance_type                       = var.instance_type
subnet_id                           = module.vpc.subnet.id
vpc_id                              = module.vpc.my_vpc.id
prefix                              = var.prefix
security_group_ec2                  = var.security_group_ec2
rds_port                            = var.rds_port
cidr_block_private_subnet1          = var.cidr_block_private_subnet1
cidr_block_private_subnet2          = var.cidr_block_private_subnet2
cidr_block_public_subnet            = var.cidr_block_public_subnet
region                              = var.region
}

module "DB" {
    source = "./DB"
  
allocated_storage               = var.allocated_storage
engine                          = var.engine
engine_version                  = var.engine_version
instance_class                  = var.instance_class
multi_az                        = var.multi_az
name                            = var.name
username                        = var.username
password                        = var.password 
port                            = var.port
publicly_accessible             = var.publicly_accessible
storage_encrypted               = var.storage_encrypted
storage_type                    = var.storage_type
vpc_security_group_ids          = var.vpc_security_group_ids
subnetgroup                     = var.subnetgroup
vpc_id                          = module.vpc.my_vpc.id
cidr_block_private_subnet1      = var.cidr_block_private_subnet1
cidr_block_private_subnet2      = var.cidr_block_private_subnet2
prefix                          = var.prefix 
region                          = var.region
ssh_key_path                    = var.ssh_key_path

rds_port                        = var.rds_port
cidr_block_public_subnet        = var.cidr_block_public_subnet
security_group_db               = var.security_group_db


}