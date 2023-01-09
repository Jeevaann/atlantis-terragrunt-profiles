variable "region_name" {
  description = "Region Name for VPC"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR range for VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "environment" {
  description = "Environment "
  type        = string
  default     = "Development"
}

variable "public_subnets" {
  description = "Provide Public Subnets CIDR Values"
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.2.0/24"]

}

variable "private_subnets" {
  description = "Provide Private Subnet CIDR Values"
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.3.0/24"]
}

variable "public_az" {
  description = "AZ names for Public Subnet"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "private_az" {
  description = "AZ names for Private Subnet"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}