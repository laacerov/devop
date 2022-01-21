variable "path" {default = "/home/lacero/terraform/credentials"}

provider "google" {
    project = "mibot-222814"
    region = "us-central1"
    credentials = "${file("${var.path}/terraform.json")}"
}