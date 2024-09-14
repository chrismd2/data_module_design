defmodule DataModuleDesign.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :first_name, :string
      add :last_name, :string
      add :social_security_number, :integer
      add :marital_status, :string
      add :us_phone, :string

      timestamps(type: :utc_datetime)
    end
  end
end
