resource "google_compute_firewall"  "firewall_proxy" {
  name    = "${var.host}-to-proxysip"
  network = "default"
  direction = "INGRESS"
  allow {
    protocol = "all"
#    ports    = ["22"]
  }
  source_ranges = ["${google_compute_address.static.address}"] # ip_public_instance
  source_tags = ["asterisk"]
  target_tags = ["proxy"]
}
