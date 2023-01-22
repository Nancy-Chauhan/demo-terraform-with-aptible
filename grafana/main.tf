data "aptible_environment" "example" {
  handle = "terraform-example-environment"
}

resource "aptible_app" "grafana" {
  env_id = data.aptible_environment.example.env_id
  handle = "grafana"
  config = {
    "APTIBLE_DOCKER_IMAGE"       = "grafana/grafana",
    "GF_SECURITY_ADMIN_PASSWORD" = var.GF_SECURITY_ADMIN_PASSWORD,
    "GF_SECURITY_SECRET_KEY"     = var.GF_SECURITY_SECRET_KEY,
    "GF_DEFAULT_INSTANCE_NAME"   = var.GF_DEFAULT_INSTANCE_NAME,
    "GF_SERVER_ROOT_URL"         = var.GF_SERVER_ROOT_URL,
    "GF_SESSION_PROVIDER"        = var.GF_SESSION_PROVIDER,
    "GF_SESSION_PROVIDER_CONFIG" = var.GF_SESSION_PROVIDER_CONFIG,
    "GF_LOG_MODE"                = var.GF_LOG_MODE,
    "GF_DATABASE_TYPE"           = var.GF_DATABASE_TYPE,
    "GF_DATABASE_HOST"           = var.GF_DATABASE_HOST,
    "GF_DATABASE_NAME"           = var.GF_DATABASE_NAME,
    "GF_DATABASE_USER"           = var.GF_DATABASE_USER,
    "GF_DATABASE_PASSWORD"       = var.GF_DATABASE_PASSWORD,
    "GF_DATABASE_SSL_MODE"       = var.GF_DATABASE_SSL_MODE,
    "FORCE_SSL"                  = var.FORCE_SSL,
  }
}

resource "aptible_endpoint" "grafana_endpoint" {
  env_id         = data.aptible_environment.example.env_id
  resource_id    = aptible_app.grafana.app_id
  resource_type  = "app"
  process_type   = "cmd"
  default_domain = true
  endpoint_type  = "https"
  depends_on = [
    aptible_app.grafana
  ]
  platform       = "alb"
  container_port = 3000
}
