# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gymex,
  ecto_repos: [Gymex.Repo]

# Configures the endpoint
config :gymex, GymexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "q+9P2VrwoXSlSxYNgcs9kyA05xKDSwImUCGN9IUxbEpVv4yfu7kBOPhsBynqRNmK",
  render_errors: [view: GymexWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Gymex.PubSub,
  live_view: [signing_salt: "edQ2ZjWs"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :bcrypt_elixir, log_rounds: 4

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
