variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "sg_name" {
    default = ["mongodb","mysql","rabbitmq","redis","catalogue","user","cart","shipping","payment","frontend","bastion","frontend_lb","backend_lb"]
}

