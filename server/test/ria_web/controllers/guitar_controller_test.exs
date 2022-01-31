defmodule RiaWeb.GuitarControllerTest do
  use RiaWeb.ConnCase

  import Ria.GuitarsFixtures

  alias Ria.Guitars.Guitar

  @create_attrs %{
    brand: "some brand",
    img_url: "some img_url",
    prod_year: 42,
    type: "some type"
  }
  @update_attrs %{
    brand: "some updated brand",
    img_url: "some updated img_url",
    prod_year: 43,
    type: "some updated type"
  }
  @invalid_attrs %{brand: nil, img_url: nil, prod_year: nil, type: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all guitars", %{conn: conn} do
      conn = get(conn, Routes.guitar_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create guitar" do
    test "renders guitar when data is valid", %{conn: conn} do
      conn = post(conn, Routes.guitar_path(conn, :create), guitar: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.guitar_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "brand" => "some brand",
               "img_url" => "some img_url",
               "prod_year" => 42,
               "type" => "some type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.guitar_path(conn, :create), guitar: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update guitar" do
    setup [:create_guitar]

    test "renders guitar when data is valid", %{conn: conn, guitar: %Guitar{id: id} = guitar} do
      conn = put(conn, Routes.guitar_path(conn, :update, guitar), guitar: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.guitar_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "brand" => "some updated brand",
               "img_url" => "some updated img_url",
               "prod_year" => 43,
               "type" => "some updated type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, guitar: guitar} do
      conn = put(conn, Routes.guitar_path(conn, :update, guitar), guitar: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete guitar" do
    setup [:create_guitar]

    test "deletes chosen guitar", %{conn: conn, guitar: guitar} do
      conn = delete(conn, Routes.guitar_path(conn, :delete, guitar))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.guitar_path(conn, :show, guitar))
      end
    end
  end

  defp create_guitar(_) do
    guitar = guitar_fixture()
    %{guitar: guitar}
  end
end
