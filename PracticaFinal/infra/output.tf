output "ip_publica" {
  value = aws_instance.instance.public_ip
}

output "instance-id" {
  value = aws_instance.instance.id
}

output "tags-name" {
  value = aws_instance.instance.tags.Name
}

output "availability-zone" {
  value = aws_instance.instance.availability_zone
}