terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "5.31.0"
    }
  }
}

provider "github" {
  owner = "colinsalmcorner"
  token = var.github_token
}