resource "local_file" "file" {
  filename        = var.filename
  file_permission = 0700
  content         = "bye"
  lifecycle {
    prevent_destroy = false
  }
}