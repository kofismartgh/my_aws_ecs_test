provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "myterraform-test" #enable versioning on bucket
    region = "us-east-1"
    #    dynamodb_table = "myterraformstate-locking" #the hashkey has to be LockID
    key = "ecstest.tfstate" #directory

  }
}
