provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "github.com/AnastasiaKolo/terraform-modules//services/webserver-cluster?ref=v0.0.3"

  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "terraform-up-and-running-state-12345"
  db_remote_state_key    = "prod/data-stores/mysql/terraform.tfstate"  

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 10
  enable_autoscaling   = true

  custom_tags = {
    Owner      = "team-dreamteam"
    DeployedBy = "terraform"
  }
}

