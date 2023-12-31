resource "google_filestore_snapshot" "snapshot" {
  name     = "test-snapshot-${local.name_suffix}"
  instance = google_filestore_instance.instance.name
  location = "us-east1"
}

resource "google_filestore_instance" "instance" {
  name     = "test-instance-for-snapshot-${local.name_suffix}"
  location = "us-east1"
  tier     = "ENTERPRISE"

  file_shares {
    capacity_gb = 1024
    name        = "share1"
  }

  networks {
    network = "default"
    modes   = ["MODE_IPV4"]
  }
}
