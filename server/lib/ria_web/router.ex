defmodule RiaWeb.Router do
  use RiaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RiaWeb do
    pipe_through :api
  end
end
