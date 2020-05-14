resource "google_monitoring_custom_service" "customsrv" {
  service_id = "custom-srv-windows-slos-${local.name_suffix}"
  display_name = "My Custom Service"
}

resource "google_monitoring_slo" "windows_based" {
  service = google_monitoring_custom_service.customsrv.service_id
  display_name = "Terraform Test SLO with window based SLI"

  goal = 0.95
  calendar_period = "FORTNIGHT"

  windows_based_sli {
    window_period = "400s"
    good_bad_metric_filter =  join(" AND ", [
      "metric.type=\"monitoring.googleapis.com/uptime_check/check_passed\"",
      "resource.type=\"uptime_url\"",
    ])
  }
}
