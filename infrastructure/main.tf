data "google_compute_image" "pytorch" {
  family  = "pytorch-latest-gpu"
  project = "deeplearning-platform-release"
}

resource "google_compute_instance" "fastai" {
  name         = "fastai"
  machine_type = "n1-highmem-8"
  zone         = "us-central1-c"

  network_interface {
    network = "default"

    access_config {
      network_tier = "STANDARD"
    }
  }

  boot_disk {
    initialize_params {
      image = data.google_compute_image.pytorch.self_link
      size  = 200
    }
  }

  guest_accelerator {
    type  = "nvidia-tesla-t4"
    count = 1
  }

  scheduling {
    preemptible         = true
    on_host_maintenance = "TERMINATE"
    automatic_restart   = false
  }

  metadata = {
    install-nvidia-driver = true
  }
}
