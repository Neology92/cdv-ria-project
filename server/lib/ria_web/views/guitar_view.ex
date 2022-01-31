defmodule RiaWeb.GuitarView do
  use RiaWeb, :view
  alias RiaWeb.GuitarView

  def render("index.json", %{guitars: guitars}) do
    %{data: render_many(guitars, GuitarView, "guitar.json")}
  end

  def render("show.json", %{guitar: guitar}) do
    %{data: render_one(guitar, GuitarView, "guitar.json")}
  end

  def render("guitar.json", %{guitar: guitar}) do
    %{
      id: guitar.id,
      type: guitar.type,
      brand: guitar.brand,
      img_url: guitar.img_url,
      prod_year: guitar.prod_year
    }
  end
end
