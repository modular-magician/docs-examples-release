data "google_tpu_v2_runtime_versions" "available" {
  provider = google-beta
}

resource "google_tpu_v2_vm" "tpu" {
  provider = google-beta

  name = "test-tpu-${local.name_suffix}"
  zone = "us-central1-c"

  runtime_version = "tpu-vm-tf-2.13.0"
}
