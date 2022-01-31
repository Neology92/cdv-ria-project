defmodule Ria.GuitarsTest do
  use Ria.DataCase

  alias Ria.Guitars

  describe "guitars" do
    alias Ria.Guitars.Guitar

    import Ria.GuitarsFixtures

    @invalid_attrs %{brand: nil, img_url: nil, prod_year: nil, type: nil}

    test "list_guitars/0 returns all guitars" do
      guitar = guitar_fixture()
      assert Guitars.list_guitars() == [guitar]
    end

    test "get_guitar!/1 returns the guitar with given id" do
      guitar = guitar_fixture()
      assert Guitars.get_guitar!(guitar.id) == guitar
    end

    test "create_guitar/1 with valid data creates a guitar" do
      valid_attrs = %{brand: "some brand", img_url: "some img_url", prod_year: 42, type: "some type"}

      assert {:ok, %Guitar{} = guitar} = Guitars.create_guitar(valid_attrs)
      assert guitar.brand == "some brand"
      assert guitar.img_url == "some img_url"
      assert guitar.prod_year == 42
      assert guitar.type == "some type"
    end

    test "create_guitar/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Guitars.create_guitar(@invalid_attrs)
    end

    test "update_guitar/2 with valid data updates the guitar" do
      guitar = guitar_fixture()
      update_attrs = %{brand: "some updated brand", img_url: "some updated img_url", prod_year: 43, type: "some updated type"}

      assert {:ok, %Guitar{} = guitar} = Guitars.update_guitar(guitar, update_attrs)
      assert guitar.brand == "some updated brand"
      assert guitar.img_url == "some updated img_url"
      assert guitar.prod_year == 43
      assert guitar.type == "some updated type"
    end

    test "update_guitar/2 with invalid data returns error changeset" do
      guitar = guitar_fixture()
      assert {:error, %Ecto.Changeset{}} = Guitars.update_guitar(guitar, @invalid_attrs)
      assert guitar == Guitars.get_guitar!(guitar.id)
    end

    test "delete_guitar/1 deletes the guitar" do
      guitar = guitar_fixture()
      assert {:ok, %Guitar{}} = Guitars.delete_guitar(guitar)
      assert_raise Ecto.NoResultsError, fn -> Guitars.get_guitar!(guitar.id) end
    end

    test "change_guitar/1 returns a guitar changeset" do
      guitar = guitar_fixture()
      assert %Ecto.Changeset{} = Guitars.change_guitar(guitar)
    end
  end
end
