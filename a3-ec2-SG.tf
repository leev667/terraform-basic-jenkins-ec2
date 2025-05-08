# Create Security Group - SSH Traffic
resource "aws_security_group" "jenkins-ssh" {
  name        = "jenkins-ssh"
  description = "Jenkins SSH"
  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["185.92.122.211/32"]
  }

  egress {
    description = "Allow all ip and ports outbound"    
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins-ssh"
  }
}

# Create Security Group - Web Traffic
resource "aws_security_group" "jenkins-web" {
  name        = "jenkins-web"
  description = "Jenkins VPC Web"
  ingress {
    description = "Allow Port 80"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    description = "Allow all ip and ports outbound"    
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins-web"
  }
}
