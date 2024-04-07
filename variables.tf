variable "tags" {
  type = map(string)
  default = {
    Project     = "practica-3"
    owner       = "limon"
    Environment = "dev"
    cloud       = "aws"
    region      = "us-east-1"
    country     = "us"
    date        = "2021-10-20"
  }
}

resource "random_string" "bucket-limon" {
  length  = 4
  special = false
  upper   = false
  numeric = false
}
