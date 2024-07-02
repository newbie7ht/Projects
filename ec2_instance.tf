provider "aws" {
  region = "us-east-1"  # Specify your AWS region here
}

resource "aws_instance" "example" {
  ami           = "ami-12345678"  # Specify the AMI ID of your desired instance
  instance_type = "t2.micro"      # Specify the instance type (e.g., t2.micro, t3.small, etc.)

  tags = {
    Name = "ExampleInstance"  # Specify the name tag for your instance
  }

  key_name = "your_key_pair_name"  # Specify the key pair name for SSH access

  # Specify security group IDs here
  security_groups = [
    "sg-12345678",
    # Add more security group IDs if needed
  ]

  # Specify subnet ID here if deploying in a specific subnet
  subnet_id = "subnet-12345678"

  # Optional: Specify user data script for instance initialization
  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World!" > /tmp/hello.txt
    EOF
}
