 output "ssh_server_public_ip_address" {
  value = aws_instance.my_2ha[*].private_ip
}

 output "ssh_server_instance_private_ip_address" {
  value = aws_instance.my_2ha[*].public_ip
}

output "ssh_server_security_group" {
  value = aws_security_group.my_ubuntu.id
}
