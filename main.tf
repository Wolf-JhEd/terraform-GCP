provider "google" {
  credentials="${file("service_account.json")}"
  project = "ra-fia-usmp"
  region ="us-central1"
  zone="us-central1-c"
}
 
resource "google_compute_instance" "vm-instance" {
  name="terraform-instance"
  machine_type="f1-micro"

    boot_disk{
        initialize_params{
            image="debian-cloud/debian-9"
        }
    }

  network_interface{
      # A default network is created for all GCP project
      network="${google_compute_network.vpc_network.self_link}" 
  }
}
resource "google_compute_network" "vpc_network"{
  name ="terraform-network"
  auto_create_subnetworks="true"
}

