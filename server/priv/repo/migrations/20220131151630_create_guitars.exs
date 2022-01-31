defmodule Ria.Repo.Migrations.CreateGuitars do
  use Ecto.Migration

  def change do
    create table(:guitars) do
      add :type, :string
      add :brand, :string
      add :img_url, :string
      add :prod_year, :integer

      timestamps()
    end
  end
end
