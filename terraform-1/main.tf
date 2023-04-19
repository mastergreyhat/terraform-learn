# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create a new EC2 instance
resource "aws_instance" "windows_instance" {
  ami           = "ami-0bde1eb2c18cb2abe"  # Microsoft Windows Server 2022 Base
  instance_type = "t2.micro"  # Instance type
  key_name      = "windows_key"   # Name of the key pair to use for SSH access
  #vpc_security_group_ids = [aws_security_group.windows_sg.id]  # Security group ID(s)
  #subnet_id     = aws_subnet.public_subnet.id  # Subnet ID to launch the instance in
  tags = {
    Name = "test-instance"
  }
}

# Create a security group to allow inbound traffic on port 80
resource "aws_security_group" "windows_sg" {
  name_prefix = "windows_sg"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

/*
# Create a public subnet to launch the instance in
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}
*/
/*
# Create a VPC to launch the instance in
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Main VPC"
  }
}
*/

