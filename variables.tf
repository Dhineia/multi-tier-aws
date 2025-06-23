variable "aws_region" {
  description = "AWS region to deploy into"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
