#vpc craetion
resource "aws_vpc" "main" {
  cidr_block       = "192.10.0.0/24"
  tags = {
    Name = "paramesh-vpc"
  }
}

#igw creation
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "paramesh-igw"
  }
}
