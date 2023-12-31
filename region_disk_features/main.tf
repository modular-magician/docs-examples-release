resource "google_compute_region_disk" "regiondisk" {
  name                      = "my-region-features-disk-${local.name_suffix}"
  type                      = "pd-ssd"
  region                    = "us-central1"
  physical_block_size_bytes = 4096

  guest_os_features {
    type = "SECURE_BOOT"
  }

  guest_os_features {
    type = "MULTI_IP_SUBNET"
  }

  guest_os_features {
    type = "WINDOWS"
  }

  licenses = ["https://www.googleapis.com/compute/v1/projects/windows-cloud/global/licenses/windows-server-core"]

  replica_zones = ["us-central1-a", "us-central1-f"]
}
