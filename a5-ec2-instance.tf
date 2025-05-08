# EC2 Instance
resource "aws_instance" "semiramis2vm" {
  ami = "ami-05238ab1443fdf48f"
  instance_type = var.instance_type
  count = 1
  user_data = file("${path.module}/jenkins-userdata-instance.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [ aws_security_group.jenkins-ssh.id, aws_security_group.jenkins-web.id ]
  tags = {
    "Name" = "Jenkins Instance-${count.index}"
  }
}
