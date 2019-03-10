defmodule MoviesApiWeb.Router do
  use MoviesApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", MoviesApiWeb do
    pipe_through :api

    post "/users", UserController, :create
  end
end
