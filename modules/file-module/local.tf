resource "local_file" "module-demo" {
  filename = var.in-filename
  content  = var.content
  file_permission = var.permission
}