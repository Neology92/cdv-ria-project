defmodule RiaWeb.GuitarController do
  use RiaWeb, :controller

  alias Ria.Guitars
  alias Ria.Guitars.Guitar

  action_fallback RiaWeb.FallbackController

  def index(conn, _params) do
    guitars = Guitars.list_guitars()
    render(conn, "index.json", guitars: guitars)
  end

  def create(conn, guitar_params) do
    with {:ok, %Guitar{} = guitar} <- Guitars.create_guitar(guitar_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.guitar_path(conn, :show, guitar))
      |> render("show.json", guitar: guitar)
    end
  end

  def show(conn, %{"id" => id}) do
    guitar = Guitars.get_guitar!(id)
    render(conn, "show.json", guitar: guitar)
  end

  def update(conn, %{"id" => id} = guitar_params) do
    guitar = Guitars.get_guitar!(id)

    with {:ok, %Guitar{} = guitar} <- Guitars.update_guitar(guitar, guitar_params) do
      render(conn, "show.json", guitar: guitar)
    end
  end

  def delete(conn, %{"id" => id}) do
    guitar = Guitars.get_guitar!(id)

    with {:ok, %Guitar{}} <- Guitars.delete_guitar(guitar) do
      send_resp(conn, :no_content, "")
    end
  end
end
