variable "url" {
  type    = string
  default = "mysql://root:password@localhost:3306"
}

env "local" {
  // Declare where the schema definition resides.
  // Also supported:
  //   src = "./dir/with/schema"
  //   src = ["multi.hcl", "file.hcl"]
  src = "./schema.hcl"

  // Define the URL of the database which is managed in
  // this environment.
  url = "${var.url}/example"

  // Define the URL of the Dev Database for this environment
  // See: https://atlasgo.io/concepts/dev-database
  dev = "${var.url}/test"

  // The schemas in the database that are managed by Atlas.
  // schemas = ["example"]

  // Projects with Versioned Migrations
  migration {
    // URL where the migration directory resides. Only filesystem directories
    // are currently supported but more options will be added in the future.
    dir = "file://migrations"
    // Format of the migration directory: atlas | flyway | liquibase | goose | golang-migrate
    format = atlas
  }
}