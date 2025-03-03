
#public subnet creation

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.10.0.0/25"

  tags = {
    Name = "paramesh-public-subnet"
  }
}

#public-route-table
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "paramesh-public-route"
  }
}

#route-table-association
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route.id
}

#security group for public instance
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-sg"
  }
}

#ec2 in public subnet
resource "aws_instance" "web" {
  ami           = "data.aws_ami.ubuntu.id" 
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  security_groups = [aws_security_group.allow_tls.id]
  tags = {
    Name = "paramesh-public-machine"
  }
}
