defmodule Keyboard.Repo do
  use Ecto.Repo,
    otp_app: :keyboard,
    adapter: Ecto.Adapters.Postgres
end
