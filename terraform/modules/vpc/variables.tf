variable "cidr_block" {
    description = "CIDR block for VPC"
    type = string
}

variable "name" {
    description = "Name of the VPC"
    type = string
}

variable "public_subnet_1_cidr" {
  description = "The CIDR block for the first public subnet"
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "The CIDR block for the second public subnet"
  type        = string
}

variable "private_subnet_1_cidr" {
    description = "The CIDR block for the first private subnet"
    type = string
}

variable "private_subnet_2_cidr" {
    description = "The CIDR block for the second private subnet"
    type = string
}

