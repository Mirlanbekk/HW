output "endpoint" {
    value = aws_db_instance._.endpoint
}

output "security_group" {
    value = aws_security_group.db
  
}