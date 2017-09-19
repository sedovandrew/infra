resource "google_storage_bucket" "state" {
  name = "${var.bucket_name}"
  location = "${var.location}"
}
