variable "region" {
  description = "The AWS region"
  default     = "us-west-2"
}

variable "ami" {
  description = "The ID of the AMI"
}

variable "key_name" {
  description = "The name of the key pair"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet1_cidr_block" {
  description = "The CIDR block for subnet1"
  default     = "10.0.1.0/24"
}

variable "subnet2_cidr_block" {
  description = "The CIDR block for subnet2"
  default     = "10.0.2.0/24"
}
