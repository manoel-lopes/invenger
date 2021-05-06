# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :invenger,
  ecto_repos: [Invenger.Repo]

config :invenger,Invenger.Repo,
migration_primary_key: [type: :binary_id],
migration_foreign_key: [type: :binary_id]

config :invenger,Invenger.Mailer, adapter: Bamboo.LocalAdapter

# Configures the endpoint
config :invenger, InvengerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "M0sMwymStyfJYCIWPAbg6XHx96L7zBL5AL5P6hew7yF+x6riXZH6jJZV62R4D5HF",
  render_errors: [view: InvengerWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Invenger.PubSub,
  live_view: [signing_salt: "Nhg9WEgL"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
