resource "aws_key_pair" "palani_aws_ssh_keypair" {
  key_name   = "palani_aws_ssh_keypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1kGDlZ0JkPbJrQ+nvct3CEjmSYjt2JGcxru+8tSWuQrFhlq+Kuzsfdyto+msO6NfuLNe1iE023NPzJe5iEYn4Q6pxiX+Crdh6TyFOqGoxUnQfMApdJCmlaZEE8gbZfLeTkfKNBqWIHSmGOhXPovxysFo3lFM0jhOHIw030+PsA4BzLzmMGviy9KAOIfSzsde6ixo/7FqUbQ41FYm1Yis9Q6Zqs8iLuBaj143wg1JP9M+72w0YbKk3PBasA0bwO4OjRwV/5w+hJYfQYMu2ATLmQsWxJLU3uOT/7LOUg0HSuc4utpj13Z40frvp9tcOi7kedxC6KRfgEQRk6RpQcb/P palani@Palani-Ram"
  tags = {
    Name        = "palani_aws_ssh_keypair"
    Environment = var.environment
  }
}