defmodule DataModuleDesign.PeopleTest do
  use DataModuleDesign.DataCase

  alias DataModuleDesign.People

  describe "people" do
    alias DataModuleDesign.People.Person

    import DataModuleDesign.PeopleFixtures

    @invalid_attrs %{first_name: nil, last_name: nil, social_security_number: nil, marital_status: nil, us_phone: nil}

    test "list_people/0 returns all people" do
      person = person_fixture()
      assert People.list_people() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert People.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      valid_attrs = %{first_name: "some first_name", last_name: "some last_name", social_security_number: 42, marital_status: :married, us_phone: "some us_phone"}

      assert {:ok, %Person{} = person} = People.create_person(valid_attrs)
      assert person.first_name == "some first_name"
      assert person.last_name == "some last_name"
      assert person.social_security_number == 42
      assert person.marital_status == :married
      assert person.us_phone == "some us_phone"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = People.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      update_attrs = %{first_name: "some updated first_name", last_name: "some updated last_name", social_security_number: 43, marital_status: :single, us_phone: "some updated us_phone"}

      assert {:ok, %Person{} = person} = People.update_person(person, update_attrs)
      assert person.first_name == "some updated first_name"
      assert person.last_name == "some updated last_name"
      assert person.social_security_number == 43
      assert person.marital_status == :single
      assert person.us_phone == "some updated us_phone"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = People.update_person(person, @invalid_attrs)
      assert person == People.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = People.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> People.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = People.change_person(person)
    end
  end
end
