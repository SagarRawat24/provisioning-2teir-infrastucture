terraform {
  backend "s3" {
    bucket         = "sagar-remote"
    key            =  "terraform.tfstate"
    region         = "ap-south-1"
   dynamodb_table = "state-locking"

   // encrypt        = true
  }
}
