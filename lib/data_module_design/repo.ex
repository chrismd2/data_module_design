defmodule DataModuleDesign.Repo do
  use Ecto.Repo,
    otp_app: :data_module_design,
    adapter: Ecto.Adapters.Postgres
end
