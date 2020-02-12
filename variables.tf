variable "vpc_cidr" {
  description = "CIDR block for our VPC"
  default     = "10.0.0.0/16"
}

variable "subnets_cidr" {
  type    = list
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "azs" {
  type    = list
  default = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "tags" {
  type = map
  default = {
    owner       = "Engineering Zone"
    purpose     = "demo"
    provisioner = "terraform"
  }
}
