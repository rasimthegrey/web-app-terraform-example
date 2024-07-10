provider "aws" {
    region = "eu-central-1"
}



module "vpc" {
    source = "../../modules/vpc"
    cidr_block = "10.0.0.0/16"
    name = "eu-central-1-dev-web-app"
    public_subnet_1_cidr = "10.0.10.0/24"
    public_subnet_2_cidr = "10.0.20.0/24"
    private_subnet_1_cidr = "10.0.11.0/24"
    private_subnet_2_cidr = "10.0.21.0/24"
}