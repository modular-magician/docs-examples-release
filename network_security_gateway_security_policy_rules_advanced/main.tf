resource "google_network_security_gateway_security_policy" "default" {
  name        = "my-gateway-security-policy-${local.name_suffix}"
  location    = "us-central1"
  description = "gateway security policy created to be used as reference by the rule."
}

resource "google_network_security_gateway_security_policy_rule" "default" {
  name                    = "my-gateway-security-policy-rule-${local.name_suffix}"
  location                = "us-central1"
  gateway_security_policy = google_network_security_gateway_security_policy.default.name
  enabled                 = true  
  description             = "my description"
  priority                = 0
  session_matcher         = "host() == 'example.com'"
  application_matcher     = "request.method == 'POST'"
  tls_inspection_enabled  = false
  basic_profile           = "ALLOW"
}
