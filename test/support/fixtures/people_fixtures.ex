defmodule DataModuleDesign.PeopleFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DataModuleDesign.People` context.
  """

  @doc """
  Generate a person.
  """
  def person_fixture(attrs \\ %{}) do
    {:ok, person} =
      attrs
      |> Enum.into(%{
        first_name: "some first_name",
        last_name: "some last_name",
        marital_status: :married,
        social_security_number: 42,
        us_phone: "some us_phone"
      })
      |> DataModuleDesign.People.create_person()

    person
  end
end
