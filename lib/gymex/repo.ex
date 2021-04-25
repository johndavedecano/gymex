defmodule Gymex.Repo do
  use Ecto.Repo,
    otp_app: :gymex,
    adapter: Ecto.Adapters.Postgres
  use Scrivener, page_size: 15
end
