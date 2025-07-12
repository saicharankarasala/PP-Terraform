output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc-PP.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc-PP.vpc_cidr_block
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc-PP.public_subnets
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc-PP.private_subnets
}
