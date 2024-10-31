variable "ec2_config" {

  description = "for ec2 instance ami and instance type"
  type = object({
    ami           = string
    instance_type = string
  })
  validation {
    condition     = var.ec2_config.instance_type == "t2.micro" || var.ec2_config.instance_type == "t2.large"
    error_message = "Invalid instance type only t2.micro or t2.small or t2.large allowed"
  }
}

# VPC Configuration for VPC
variable "vpc_config" {
  description = "to get cidr block and name for vpc"
  type = object({
    cidr_block = string
    name       = string
  })

  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "Invalid CIDR Block for vpc ${var.vpc_config.cidr_block}"
  }
}

variable "subnet_1_config" {
  description = "to get cidr block and name for subnet_1 "
  type = object({
    cidr_block        = string
    availability_zone = string
  })
  validation {
    condition     = can(cidrnetmask(var.subnet_1_config.cidr_block))
    error_message = "Invalid CIDR Blocks for Subnets"
  }
}

variable "subnet_2_config" {
  description = "to get cidr block and name for subnet_2 "
  type = object({
    cidr_block        = string
    availability_zone = string
  })
  validation {
    condition     = can(cidrnetmask(var.subnet_2_config.cidr_block))
    error_message = "Invalid CIDR Blocks for Subnets"
  }
}

variable "target_group_config" {

  description = "details for target group"
  type = object({
    name        = string
    port        = number
    protocol    = string
    target_type = string
  })
}

variable "alb_config" {
  description = "application load balancer configuration"
  type = object({
    name               = string
    load_balancer_type = string
  })
}
