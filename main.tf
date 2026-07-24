terraform {
    required_providers {
      docker = {
        source = "kreuzwerker/docker"
        version = "~> 3.0" 
      }
    }
}

provider "docker" {

}

# Pull the Nginx image
resource "docker_image" "nginx" {
    name    = "nginx:latest"
    keep_locally = false
}

# Create and start the Nginx container
resource "docker_container" "nginx" {
    image = docker_image.nginx.image_id
    name = "tutorial-nginx-server"

    ports {
        internal = 80
        external = 8080
    }
}