output "bastion_SG_id" {
  description = "The ID of the SG"
  value = module.bastion_security_group.security_group_id
}