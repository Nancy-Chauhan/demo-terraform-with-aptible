data "aptible_environment" "example" {
  handle = "terraform-example-environment"
}

resource "aptible_app" "example-app" {
  env_id = data.aptible_environment.example.env_id
  handle = "example-app"
  config = {
    "APTIBLE_DOCKER_IMAGE" = "quay.io/aptible/deploy-demo-app"
    "REDIS_URL" : aptible_database.example-redis-db.default_connection_url,
    "DATABASE_URL" : aptible_database.example-pg-db.default_connection_url,
  }
}
resource "aptible_database" "example-redis-db" {
  env_id         = data.aptible_environment.example.env_id
  handle         = "example-redis-db"
  database_type  = "redis"
  container_size = 512
  disk_size      = 10
  version        = "5.0"
}

resource "aptible_database" "example-pg-db" {
  env_id         = data.aptible_environment.example.env_id
  handle         = "example-pg-db"
  database_type  = "postgresql"
  container_size = 1024
  disk_size      = 10
  version        = "12"
}


resource "aptible_database" "example-grafana-influx-db" {
  env_id         = data.aptible_environment.example.env_id
  handle         = "example-grafana-influx-db"
  database_type  = "influxdb"
  container_size = 512
  disk_size      = 10
  version        = "1.8"
}

resource "aptible_metric_drain" "metric-drain" {
  env_id      = data.aptible_environment.example.env_id
  database_id = aptible_database.example-grafana-influx-db.database_id
  drain_type  = "influxdb_database"
  handle      = "aptible-hosted-metric-drain"
}
