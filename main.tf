provider "aws" {
  access_key = "AKIA46G6QQAP232DOD26"
  secret_key = "PTw2VVzO5osUJr3HNiO263VPxX+eDW5vsAqQdOMq"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-09d95fab7fff3776c"
  instance_type = "t2.micro"
}
