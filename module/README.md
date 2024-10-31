# terraform-aws-load-balancer

## Overview

This Terraform module creates one load balancer atteach two instances and create two security groups one for instance and second for load balancer and create vpc and subnets and in loadbalancer atteach target group and target group hit two ec2 instances

## Features

- Creates a application load balancer
- Creates two instances
- Creates a vpc and subnets
- creates a target group

## Usage

```
ec2_config = {
  ami           = "ami-0dee22c13ea7a9a67"
  instance_type = "t2.micro"
}

vpc_config = {
  name       = "vpc-for-load-balancer"
  cidr_block = "10.0.0.0/24"
}

subnet_1_config = {
  cidr_block        = "10.0.0.0/25"
  availability_zone = "ap-south-1a"
}
subnet_2_config = {
  cidr_block        = "10.0.0.128/25"
  availability_zone = "ap-south-1b"
}

target_group_config = {
  name        = "target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
}

alb_config = {
  name               = "application-load-balancer"
  load_balancer_type = "application"
}


```
