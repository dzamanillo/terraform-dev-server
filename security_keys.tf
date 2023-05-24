# resource "tls_private_key" "prod_key_name" {
#     algorithm   = "ECDSA"
#   ecdsa_curve = "P384"

# }

# resource "aws_key_pair" "prod" {
#   key_name   = var.key_name
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDw0JoD/zyAXMIfLaNjtrGbkwRHkDp9gbIm/48WO17G6+EqfajkJZL264gIuzRLtub6zJm6Anko8QxT0a66jfQ84302NOyjT3wWU7iM9ovWYvda3OPrKgEMAuAZRm4JC9N5prtU+KRoWIRHqFklI0ION14USN2/7VuFVrKeKWopwY/u+PTXDNwWwfpVo7/cZJvE+0HnbSMZwAoeXspuWRWzxy80HxhMdlBS7K06Lwlxvy7i3AanAtSTxW1+KcXanw4MtbtMNYPnL74pSc2SiABOpJ57x+uyMIssH90S3mDXbAikUa9YusvUp2C3i2bliKNGQUWyugA6dg8OO5mwMO/ktyiMjZET3hK/j+DnOebq42jELMBqaIYRVgpXpp2HX+G0yt5y+A9HHJ5UuAMcxYF+Go4jn7tC4umAcdxuCiuE1FrUwnf0BQTs4p6oQBDY19K+g7z+jt3ADZieg1Xd/tsUxyE+mJ8Du4dTh2gbt2xm2AFYX5q+RGbCjHszGIcVUbs= daniel_zamanillo@daniels-air.lan"
# }

# resource "local_file" "prod_file" {
#   filename             = pathexpand("~/.ssh/${var.key_name}")
#   file_permission      = "400"
#   directory_permission = "700"
#   content              = tls_private_key.prod_key_name.private_key_pem
# }
