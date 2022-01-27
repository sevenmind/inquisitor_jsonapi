defmodule Repo do
  @moduledoc false
  use Ecto.Repo, otp_app: :inquisitor_jsonapi, adapter: Ecto.Adapters.Postgres
end
