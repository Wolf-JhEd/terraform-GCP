provider "google" {
  credentias="${file("service-account.json")}"
  project = "ra-fia-usmp"
  region ="us-centrall"
  zone="us-centrall-c"
}

resource "google_compute_instance" "vm-instance" {
  name="terraform-instance"
  machine_type="f1-micro"

    boot_disk{
        initialize_params
        {
            image="debian-cloud/debian-9"
        }
    }
}

network_interface{
    # A default network is created for all GCP project
    network="${goolgle_compute_network.vpc_network.sef_link}"
    access_config={
    }
}

resource "google_compute_network" "vpc_network"{
  name ="terraform-network"
  auto_create_subnetworks="true"
}

