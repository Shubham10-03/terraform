output "public_ip" {
  value = "http://${aws_instance.nginxserver.public_ip}"
  description = "Public Ip for Nginx server"
}