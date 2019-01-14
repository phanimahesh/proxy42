# Since configuration is shared in umbrella projects, this file
# should only configure the :p42_admin application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :p42_admin,
  es_url: "http://localhost:9200/proxy42"

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with webpack to recompile .js and .css sources.
config :p42_admin, P42Admin.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/.bin/webpack-dev-server",
      "-d", "--watch", "--watch-stdin",
      "--mode", "development",
      "--inline",
      "--hot",
      "--output-path", Path.expand("../priv/static/", __DIR__),
      cd: Path.expand("../assets", __DIR__)
    ]
    # node: [
    #   "node_modules/webpack/bin/webpack.js",
    #   "--mode",
    #   "development",
    #   "--watch-stdin",
    #   cd: Path.expand("../assets", __DIR__)
    # ]
  ]

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# Mix task:
#
#     mix phx.gen.cert
#
# Note that this task requires Erlang/OTP 20 or later.
# Run `mix help phx.gen.cert` for more information.
#
# The `http:` config above can be replaced with:
#
#     https: [
#       port: 4001,
#       cipher_suite: :strong,
#       keyfile: "priv/cert/selfsigned_key.pem",
#       certfile: "priv/cert/selfsigned.pem"
#     ],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

# Watch static and templates for browser reloading.
config :p42_admin, P42Admin.Endpoint,
  live_reload: [
    # patterns: [
    #   ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
    #   ~r{priv/gettext/.*(po)$},
    #   ~r{lib/p42_admin/views/.*(ex)$},
    #   ~r{lib/p42_admin/templates/.*(eex)$}
    # ]
  ]
