variable "cidr_block" {
  description = "AWS VPC CIDR"
  type        = string
  default     = ""
}

variable "public_subnet_1" {
  description = "VPC Public Subnet CIDR"
  type        = string
  default     = ""
}

variable "public_subnet_2" {
  description = "VPC Public Subnet CIDR"
  type        = string
  default     = ""
}

variable "private_subnet_1" {
  description = "VPC Private Subnet CIDR"
  type        = string
  default     = ""
}

variable "private_subnet_2" {
  description = "VPC Private Subnet CIDR"
  type        = string
  default     = ""
}

#####
variable "project_name" {
  description = "Project name for AMI lookup and tags"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = ""
}

#####
variable "policy_name" {
  description = "IAM Policy Name"
  type        = string
  default     = ""
}

variable "instance_profile_name" {
  description = "Instance Profile Name"
  type        = string
  default     = ""
}

variable "ec2_role_name" {
  description = "EC2 Role Name"
  type        = string
  default     = ""
}
