# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-0b7a00db5bbbf8a0a"
resource "aws_key_pair" "sample_key" {
  key_name   = "sample-key"
  public_key = var.sample_public_key

  tags = {
    "Name" = "sample_public_key"
  }
}
resource "aws_security_group" "this" {
  description = "ssh and https"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 443
  }]
  name                   = "ssh-https"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = "vpc-01c0cd4d7700ba67f"
}

# __generated__ by Terraform
resource "aws_instance" "this" {
  ami                                  = "ami-0c1c30571d2dae5c9"
  associate_public_ip_address          = true
  instance_type                        = "t2.micro"
  key_name                             = aws_key_pair.sample_key.key_name
  vpc_security_group_ids               = [aws_security_group.this.id]
}

output "sample_server_dns" {
  value = aws_instance.this.public_dns
}

