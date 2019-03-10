# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :movies_api,
  ecto_repos: [MoviesApi.Repo]

# Configures the endpoint
config :movies_api, MoviesApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xnvvj0q3tuVuEvBYhil8HWX2Hy+6+YCpT1afAUttxI5uYII4h4Y6d40o4QYMfY2D",
  render_errors: [view: MoviesApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MoviesApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :myApi, MyApi.Guardian,
  issuer: "movies_api",
  secret_key: "NYBtZuS6ntUbabCQTsARd9IjhLb7hWjs8/3VHozM/aYHURZApdX4gXVZwovlZYlC"
