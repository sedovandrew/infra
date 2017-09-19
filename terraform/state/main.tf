terraform {
  backend "gcs" {
  }
}

provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

module "bucket" {
  source = "../modules/bucket"
  bucket_name = "${var.bucket_name}"
  location = "${var.region}"
}
