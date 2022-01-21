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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCt36yP5PesG6k5XUZZ6u0Ann9n2An7FLQ8bndMG8pKu57D+N4Xtl8S9NDJgEKAOJnnaNxfwtKSNBxShhg3eXUueLoSEptCpDb5XnHXxo+jP/E2lANNF5Oq49jvPHJlkE0mifBDG7fGFOKV0+rFYH4xN4HTEJh37OEm13x1nF/PzqgGKUTUSe66cs5+ohPtHAavKyVcZWmsDCAwAikLu7gXajSHZIwiWh6FwgTyq4WRyR8AP1l1oOSz5qK0lCO1N4vHAcjfAnR/r+stU3KCUhmqZsKUeICsl0Dd8+aBwbEkrRLZWylpaEcHiKt0UnvCwOE9fgu7gqOHOpgmZabmSzYH root@serv-devop"
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
  default = "~/.ssh/google_compute_engine"
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
  #rabbit_n1 = "cwmoyseh:QHJ2uuYWSv5-qcQ9QsJwI_0zkOdYoMZ7@advanced-maroon-bear.rmq3.cloudamqp.com"
}

variable "rabbit_n2" {
  #rabbit_n2 = "vvgifgbp"
}

variable "queue_client" {
  #queue_client = "client.5fa425ec8b3cd28bd7d24f12"
}

variable "server_name_rabbit" {
  #server_name_rabbit = "advanced-maroon-bear.rmq3.cloudamqp.com"
}

variable "server_port_rabbit" {
  #server_port_rabbit = "5671"
}

variable "server_user_rabbit" {
  #server_user_rabbit = "cwmoyseh"
}

variable "server_password_rabbit" {
  #server_password_rabbit = "QHJ2uuYWSv5-qcQ9QsJwI_0zkOdYoMZ7"
}

variable "server_vhost_rabbit" {
  #server_vhost_rabbit = "vvgifgbp"
}

variable "server_exchange_rabbit" {
  #server_exchange_rabbit = "voicebot.calls"
}
variable "server_routing_rabbit" {
  #server_routing_rabbit = "voicebot.calls.finished"
}
