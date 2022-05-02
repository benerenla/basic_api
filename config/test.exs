import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :basic_api, BasicApi.Repo,
  username: "postgres",
  password: "root",
  hostname: "localhost",
  database: "basic_api_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :basic_api, BasicApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "d27LfAiwcgAoW7xXSM7fPPsPkiKgDVkQy1cm2z2RAij5l7HYLJo5xKzX7soTivbX",
  server: false

# In test we don't send emails.
config :basic_api, BasicApi.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
