output "private_SG_id" {
  description = "The ID of the security group"
  value       = module.private_security_group.security_group_id
}