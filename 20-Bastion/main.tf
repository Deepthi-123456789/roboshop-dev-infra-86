resource "aws_instance" "bastion" {
    ami = local.ami_id
    vpc_security_group_ids = [local.bastion_sg_id]
    subnet_id = local.public_subnet_id
    iam_instance_profile = aws_iam_instance_profile.bastion.name
    instance_type = "t3.micro"

    user_data = file("bastion.sh")

    tags = {
        Name = "${var.project}-${var.environment}-bastion"
        environment = var.environment
        project = var.project
        terrafrom = true
    }
}

resource "aws_iam_instance_profile" "bastion" {
  name = "bastion"
  role = "BastionTerraformAdmin"
}
