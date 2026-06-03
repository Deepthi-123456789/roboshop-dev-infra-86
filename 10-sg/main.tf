#  module "catalogue" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "${local.common_name}-catalogue"  #roboshop-dev-catalogue
#   use_name_prefix = false
#   description = "Security group for catalogue with custom ports open within VPC, egress all traffic"
#   vpc_id      = data.aws_ssm_parameter.vpc_id.value

# } 

module "sg" {
  count = length(var.sg_name)
  source      = "git::https://github.com/Deepthi-123456789/terrafrom-aws-sg-86.git"
  sg_name     = var.sg_name[count.index]
  project     = var.project
  environment = var.environment
  vpc_id      = data.aws_ssm_parameter.vpc_id.value
}