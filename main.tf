provider "aws" {
  access_key = "AKIA46G6QQAPZW6FYT5A"
  secret_key = "mH1dvbvHEteEZpw9jwwpqNpgjPF9Nx2t1hNgT/eh"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-09d95fab7fff3776c"
  instance_type = "t2.micro"
}
