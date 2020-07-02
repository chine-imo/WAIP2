terraform {
  backend "s3" {
    bucket = "weatherapp-bucket"
    key    = "weather-app-method2-terraform-tfstate"
    region = "eu-west-2"
  }
}