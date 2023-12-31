
resource "google_pubsub_topic" "mytopic" {
  name = "my-topic-${local.name_suffix}"
}

resource "google_cloudbuild_trigger" "pubsub-config-trigger" {
  location    = "us-central1"
  name        = "pubsub-trigger-${local.name_suffix}"
  description = "acceptance test example pubsub build trigger"

  pubsub_config {
    topic = google_pubsub_topic.mytopic.id
  }

  source_to_build {
    uri       = "https://hashicorp/terraform-provider-google-beta"
    ref       = "refs/heads/main"
    repo_type = "GITHUB"
  }

  git_file_source {
    path      = "cloudbuild.yaml"
    uri       = "https://hashicorp/terraform-provider-google-beta"
    revision  = "refs/heads/main"
    repo_type = "GITHUB"
  }

  substitutions = {
    _ACTION       = "$(body.message.data.action)"
  }

  filter = "_ACTION.matches('INSERT')"
}
