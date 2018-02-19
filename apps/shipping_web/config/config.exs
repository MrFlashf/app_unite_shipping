# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :shipping_web,
  namespace: ShippingWeb,
  ecto_repos: [ShippingWeb.Repo]

# Configures the endpoint
config :shipping_web, ShippingWebWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7O/t6LnpYQI3hat3pVof6mwJxFtBBGaH572LOtVQ0j4vlnRAPxROyU3WGsui+h8B",
  render_errors: [view: ShippingWebWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ShippingWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
