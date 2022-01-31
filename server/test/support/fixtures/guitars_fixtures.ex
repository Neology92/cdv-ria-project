defmodule Ria.GuitarsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ria.Guitars` context.
  """

  @doc """
  Generate a guitar.
  """
  def guitar_fixture(attrs \\ %{}) do
    {:ok, guitar} =
      attrs
      |> Enum.into(%{
        brand: "some brand",
        img_url: "some img_url",
        prod_year: 42,
        type: "some type"
      })
      |> Ria.Guitars.create_guitar()

    guitar
  end
end
