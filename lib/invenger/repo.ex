defmodule Invenger.Repo do
  use Ecto.Repo,
    otp_app: :invenger,
    adapter: Ecto.Adapters.Postgres
end
