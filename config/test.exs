import Config

config :inquisitor_jsonapi, ecto_repos: [Repo]

config :inquisitor_jsonapi, Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "inquisitor_jsonapi_test",
  hostname: System.get_env("POSTGRES_HOST"),
  pool: Ecto.Adapters.SQL.Sandbox,
  size: 1
