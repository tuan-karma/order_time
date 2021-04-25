# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :order_time,
  ecto_repos: [OrderTime.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :order_time, OrderTimeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "60b3lYR+Fi0h6x0jXwAU22KylBuGKy5TJKA9Ha9exHsX0icy6x0FX+xs0o/PgqjO",
  render_errors: [view: OrderTimeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: OrderTime.PubSub,
  live_view: [signing_salt: "4RlOM9PU"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Config utc_datetime for Ecto Migration
# config :order_time, OrderTime.Repo, migration_timestamps: [type: :utc_datetime]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
