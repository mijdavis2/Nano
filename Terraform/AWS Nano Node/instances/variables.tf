variable "nano_instance_name" {
  description = "Nano Node Host Name"
  default     = "Nano_Node"
}

variable "key_name" {
  description = "Name of the EC2 keypair to use in AWS."
  default     = "Nano"
}

variable "instance_type" {
  description = "AWS Instance Size"
  default     = "t2.micro"
}

variable "nano_sg_id" {}
variable "nano_subnet_id" {}
variable "region" {}
variable "nano_vpc_id" {}
