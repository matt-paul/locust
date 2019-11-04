terraform {
  backend "gcs" {
    bucket  = "locust-tf-state-mp"
    prefix  = "terraform/state"
  }
}
