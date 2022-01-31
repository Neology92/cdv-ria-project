defmodule RiaWeb.Router do
  use RiaWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(ProperCase.Plug.SnakeCaseParams)
  end


  scope "/api", RiaWeb do
    pipe_through :api

    resources("/guitars", GuitarsController, except: [:new, :edit])
  end
end
