resource "google_compute_address" "static" {
  name = "ip-${var.host}"
  region = var.region
}

resource "google_compute_instance" "default" {
#multi_server creacion dinamica
#count = "${length(var.host)}"
#name = "${count.index+1}"

#instancia declarada
name = var.host

machine_type = var.machine_type
zone = var.zone

tags = ["asterisk"]

boot_disk {
    initialize_params {
        image = var.image
    }
 }

network_interface {
    network = var.network
    access_config {
      nat_ip = google_compute_address.static.address
    }
 }


service_account {
    scopes = ["userinfo-email","compute-ro","storage-ro"]
 }

depends_on = [google_compute_firewall.firewall_proxy]

}



# Modulo sleep para completar creacion
resource "time_sleep" "wait_for_create_instace" {
  create_duration = "80s"

  depends_on = [google_compute_instance.default]
}

# Etapa de conexion remota y configuracion en server
resource "null_resource" "script-deploy" {
connection {
  type = "ssh"
  host = "${google_compute_address.static.address}"
  user = var.username
  private_key = file(var.private_key_path)
}

#cargar script local para ejecutar en remote-exec
#provisioner "file" {
#  source      = "script.sh"
#  destination = "/tmp/script.sh"
#}

provisioner "remote-exec" {
  inline = [
    #envio de variables
      "sudo timedatectl set-timezone ${var.timezone}",
      "sudo sed -i 's,;date.timezone =.*$,date.timezone = ${var.timezone},'  /etc/php/7.0/cli/php.ini",
      "sudo sed -i 's/_USER_AGENT_/${var.host}/g'  '/etc/asterisk/sip.conf'",
      "sudo sed -i 's/_SIP_EXTERN_ADDR_/${google_compute_address.static.address}/g'  '/etc/asterisk/sip.conf'",
      "sudo sed -i 's/_SIP_LOCAL_IP_/${google_compute_instance.default.network_interface.0.network_ip}/g'  '/etc/asterisk/sip.conf'",
      "sudo sed -i 's/_SIP_LOCAL_NET_/${var.subnet}/g'  '/etc/asterisk/sip.conf'",
      "sudo sed -i 's/_ASTERISK_MANAGER_USER_/${var.asterisk_manager}/g'  '/etc/asterisk/manager.conf'",
      "sudo sed -i 's/_ASTERISK_MANAGER_SECRET_/${var.asterisk_manager}/g'  '/etc/asterisk/manager.conf'",
      "sudo sed -i 's/_IP_BALANCE_VSK_/${var.balance_vosk}/g'  '/etc/asterisk/res-speech-vosk.conf'",
      "sudo sed -i 's/_URL_RABBIT_NODE1_/${var.rabbit_n1}/g'  '/var/www/asterisk-voicebot/src/.env'",
      "sudo sed -i 's/_URL_RABBIT_NODE2_/${var.rabbit_n2}/g'  '/var/www/asterisk-voicebot/src/.env'",
#      "sudo sed -i 's/_URL_RABBIT_NODE_/amqps:\/\/\${var.rabbit_n1}\/\${var.rabbit_n2}/g' '/var/www/asterisk-voicebot/src/.env'",
      "sudo sed -i 's/_QUEUE_CLIENT_/${var.queue_client}/g'  '/var/www/asterisk-voicebot/src/.env'",
      "sudo sed -i 's/_HOSTNAME_/${var.host}/g'  '/var/www/asterisk-voicebot/src/.env'",
      "sudo sed -i 's/_PUBLIC_IP_/${google_compute_address.static.address}/g'  '/var/www/asterisk-voicebot/src/.env'",
      "sudo sed -i 's/_SERVER_NAME_RABBIT_/${var.server_name_rabbit}/g'  '/var/www/asterisk-voicebot/src/.env'",
      "sudo sed -i 's/_SERVER_PORT_RABBIT_/${var.server_port_rabbit}/g'  '/var/www/asterisk-voicebot/src/.env'",
      "sudo sed -i 's/_SERVER_USER_RABBIT_/${var.server_user_rabbit}/g'  '/var/www/asterisk-voicebot/src/.env'",
      "sudo sed -i 's/_SERVER_PASSWORD_RABBIT_/${var.server_password_rabbit}/g'  '/var/www/asterisk-voicebot/src/.env'",
      "sudo sed -i 's/_SERVER_VHOST_RABBIT_/${var.server_vhost_rabbit}/g'  '/var/www/asterisk-voicebot/src/.env'",
      "sudo sed -i 's/_SERVER_EXCHANGE_RABBIT_/${var.server_exchange_rabbit}/g'  '/var/www/asterisk-voicebot/src/.env'",
      "sudo sed -i 's/_SERVER_ROUTING_RABBIT_/${var.server_routing_rabbit}/g'  '/var/www/asterisk-voicebot/src/.env'",
      #arreglo de liberia no encontrada
      "sudo sed -i 's/lib64/lib/g' '/etc/asterisk/asterisk.conf'",
      #inicializa asterisk+forevers
      "sudo /etc/init.d/asterisk restart",
      "sudo npm start --prefix /var/www/asterisk-voicebot",
      "sudo forever restartall",
 ]
}

depends_on = [time_sleep.wait_for_create_instace]

}

output "machine_type" {
  value = "${google_compute_instance.default.*.machine_type}"
}

output "name" {
  value = "${google_compute_instance.default.*.name}"
}

output "zone" {
  value = "${google_compute_instance.default.*.zone}"
}

output "ip" {
  value = "${google_compute_instance.default.network_interface.0.network_ip}"
}

output "ip-public" {
  value = "${google_compute_address.static.address}"
}