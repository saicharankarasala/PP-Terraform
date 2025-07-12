output "bastion_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.bastion_instance.public_ip
}

output "private_ec2_ip" {
  description = "The private IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = [for i in module.private_instance : i.private_ip]
}

output "bastion_instance_id" {
  description = "The ID of the bastion instance"
  value       = module.bastion_instance.id
}