output "bucket_url" {
  value = google_storage_bucket.hacksite.url
}

output "backend_lb_url" {
  value = google_compute_backend_bucket.hacksite_backend.self_link
}

output "frontend_lb_ip"{
  value = google_compute_global_forwarding_rule.default.ip_address
}
