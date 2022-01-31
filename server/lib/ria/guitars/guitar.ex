defmodule Ria.Guitars.Guitar do
  use Ecto.Schema
  import Ecto.Changeset

  schema "guitars" do
    field :brand, :string
    field :img_url, :string
    field :prod_year, :integer
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(guitar, attrs) do
    guitar
    |> cast(attrs, [:type, :brand, :img_url, :prod_year])
    |> validate_required([:type, :brand, :prod_year])
  end
end
