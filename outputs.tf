output "bastion_ip" {
  value = module.compute.bastion_ip
}

output "application_ip" {
  value = module.compute.application_ip
}

output "database_endpoint" {
  value = module.compute.database_endpoint
}