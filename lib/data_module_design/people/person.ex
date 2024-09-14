defmodule DataModuleDesign.People.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field :first_name, :string
    field :last_name, :string
    field :social_security_number, :integer
    field :marital_status, Ecto.Enum, values: [:married, :single]
    field :us_phone, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:first_name, :last_name, :social_security_number, :marital_status, :us_phone])
    |> validate_required([:first_name, :last_name, :social_security_number, :marital_status, :us_phone])
  end
end
