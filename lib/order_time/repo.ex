defmodule OrderTime.Repo do
  use Ecto.Repo,
    otp_app: :order_time,
    adapter: Ecto.Adapters.Postgres
end
