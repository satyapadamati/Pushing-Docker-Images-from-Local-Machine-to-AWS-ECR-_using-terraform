output "aws_instance_ip" {
    value = aws_instance.web.public_ip
  
}
output "aws_ecr_repository" {
    value = aws_ecr_repository.example
  
}