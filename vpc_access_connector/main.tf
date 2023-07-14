resource "google_vpc_access_connector" "connector" {
  name          = "vpc-con-${local.name_suffix}"
  ip_cidr_range = "10.18.0.0/28"
  network       = "default"
  min_instances  = 2
  max_instances  = 3
}
