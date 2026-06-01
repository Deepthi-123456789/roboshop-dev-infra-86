module "vpc" {
    #vpc
    #source = "../terraform-aws-vpc-86"
    source = "git::https://github.com/Deepthi-123456789/terraform-aws-vpc-86.git"
    vpc_cidr = var.vpc_cidr
    project = var.project
    environment = var.environment

    #public subnet
    public_subnet_cidrs = var.public_subnet_cidrs

    #private subnet
    private_subnet_cidrs = var.private_subnet_cidrs
    
    #database subnet
    database_subnet_cidrs = var.database_subnet_cidrs
    
    #vpc peering
    is_peering_required = false

}