defmodule Jaxie.Repo do
  use Ecto.Repo,
    otp_app: :jaxie,
    adapter: Ecto.Adapters.Postgres
end
