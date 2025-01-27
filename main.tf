terraform {
  required_providers {
    docker = {
        source = "kreuzwerker/docker"
        version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = false
}

resource "docekr_container" "nginx" {
  image = docker_image.nginx
  name = "nginx"

  ports {
    internal = 80
    external = 8000
  }
}