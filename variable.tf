variable "machine_type" {
  default     = "e2-highcpu-2"
}

variable "zone" {
  default = "us-central1-c"
}

variable "region" {
  default = "us-central1"
}

variable "network" {
  default = "default"
}

variable "us-subnet" {
  default = "10.128.0.0/24"
}

variable "subnet" {
  default = "10.128.0.0"
}

variable "image" {
#  default     = "ubuntu-os-cloud/ubuntu-1804-lts"
  default = "projects/mibot-222814/global/images/vsk-plantilla-v3"
}

variable "startup_script_bucket" {
  default = "gs://bucket_ast-build/install-vsk.sh"
}

variable "public_key" {
  default = "ssh-rsa XXXXXXXX root@serv-devop"
}

variable "username" {
  default = "root"
}

variable "asterisk_manager" {
  default = "lponce"
}

variable "balance_vosk" {
  default = "10.128.0.61"
}

variable "private_key_path" {
  default = "/var/lib/jenkins/workspace/asterisk/google_compute_engine"
}

variable "timezone" {
  default = "America/Santiago"
}



#variables dinamicas se generan x bash...

#variable "name_count" {
  #default     = ["server1", "server2", "server3"]
#}

variable "host" {
  #host = "prueba01-tf"
}

variable "rabbit_n1" {
  #rabbit_n1 = "aaaaaa:uuuuuuuu@advanced-maroon-bear.rmq3.cloudamqp.com"
}

variable "rabbit_n2" {
  #rabbit_n2 = "vvgifgbp"
}

variable "queue_client" {
  #queue_client = "client.123459921991291"
}

variable "server_name_rabbit" {
  #server_name_rabbit = "advanced-maroon-bear.rmq3.cloudamqp.com"
}

variable "server_port_rabbit" {
  #server_port_rabbit = "5671"
}

variable "server_user_rabbit" {
  #server_user_rabbit = "aaaaaa"
}

variable "server_password_rabbit" {
  #server_password_rabbit = "XXXXXXXX-PASSS"
}

variable "server_vhost_rabbit" {
  #server_vhost_rabbit = "uuuuuuuuuu"
}

variable "server_exchange_rabbit" {
  #server_exchange_rabbit = "voicebot.calls"
}
variable "server_routing_rabbit" {
  #server_routing_rabbit = "voicebot.calls.finished"
}
