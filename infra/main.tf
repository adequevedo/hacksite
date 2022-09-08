terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=3.5.0"
    }
  }
}

# GCP provider
provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

# GCP beta provider
provider "google-beta" {
  project = var.gcp_project
  region  = var.gcp_region
}

# Bucket to store website
resource "google_storage_bucket" "hacksite" {
  provider      = google
  name          = "hacktime-site"
  location      = "US"
  force_destroy = true


  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://image-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }

}

# Make new objects public
resource "google_storage_default_object_access_control" "hacksite_read" {
  bucket = google_storage_bucket.hacksite.name
  role   = "READER"
  entity = "allUsers"
}

# Reserve an external IP
resource "google_compute_global_address" "hacksite" {
  provider = google
  name     = "hacksite-lb-ip"
}

#Get the managed DNS zone
# data "google_dns_managed_zone" "gcp_hacksite_dev" {
#   provider = google
#   name     = "gcp-hacksite-dev"
# }
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Register google domain name - done manually

# Create google managed cert
# resource "google_compute_managed_ssl_certificate" "default" {
#   name = "hacksite-cert"
#
#   managed {
#     domains = ["alexdeq.com"]
#   }
# }

# Reserve external IP
resource "google_compute_address" "hacksite-static-ip-address" {
  name = "hacksite-static-ip-address"
}

# Create an external HTTP(S) load balancer with backend buckets
resource "google_compute_backend_bucket" "hacksite_backend" {
  name        = "hacksite-backend-bucket"
  description = "LB to hacksite"
  bucket_name = google_storage_bucket.hacksite.name
  enable_cdn  = true
}

# GCP URL MAP
resource "google_compute_url_map" "hacksite" {
  provider        = google
  name            = "hacksite-url-map"
  default_service = google_compute_backend_bucket.hacksite_backend.id
}

# GCP target proxy
resource "google_compute_target_http_proxy" "hacksite" {
  provider = google
  name     = "hacksite-target-proxy"
  url_map  = google_compute_url_map.hacksite.id
  # ssl_certificates = [google_compute_managed_ssl_certificate.website.self_link]
}

# GCP forwarding rule
resource "google_compute_global_forwarding_rule" "default" {
  provider              = google
  name                  = "hacksite-forwarding-rule"
  load_balancing_scheme = "EXTERNAL"
  ip_address            = google_compute_global_address.hacksite.address
  ip_protocol           = "TCP"
  port_range            = "80"
  target                = google_compute_target_http_proxy.hacksite.id
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# # Add the IP to the DNS
# resource "google_dns_record_set" "hacksite" {
#   provider     = google
#   name         = "hacksite.${data.google_dns_managed_zone.gcp_hacksite_dev.name}"
#   type         = "A"
#   ttl          = 300
#   managed_zone = data.google_dns_managed_zone.gcp_hacksite_dev.name
#   rrdatas      = [google_compute_global_address.hacksite.address]
# }
#
