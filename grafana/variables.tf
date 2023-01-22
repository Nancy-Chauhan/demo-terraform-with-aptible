variable "GF_SECURITY_ADMIN_PASSWORD" {
  type      = string
  sensitive = true
}
variable "GF_SECURITY_SECRET_KEY" {
  type      = string
  sensitive = true
}
variable "GF_DEFAULT_INSTANCE_NAME" {
  type      = string
  sensitive = true
}
variable "GF_SERVER_ROOT_URL" {
  type      = string
  sensitive = true
}
variable "GF_SESSION_PROVIDER" {
  type      = string
  sensitive = true
}
variable "GF_SESSION_PROVIDER_CONFIG" {
  type      = string
  sensitive = true
}
variable "GF_LOG_MODE" {
  type      = string
  sensitive = true
}
variable "GF_DATABASE_TYPE" {
  type      = string
  sensitive = true
}
variable "GF_DATABASE_HOST" {
  type      = string
  sensitive = true
}
variable "GF_DATABASE_NAME" {
  type      = string
  sensitive = true
}
variable "GF_DATABASE_USER" {
  type      = string
  sensitive = true
}
variable "GF_DATABASE_PASSWORD" {
  type      = string
  sensitive = true
}
variable "GF_DATABASE_SSL_MODE" {
  type      = string
  sensitive = true
}
variable "FORCE_SSL" {
  type      = string
  sensitive = true
}
