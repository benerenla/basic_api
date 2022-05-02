defmodule BasicApi.Repo do
  use Ecto.Repo,
    otp_app: :basic_api,
    adapter: Ecto.Adapters.Postgres
end
