defmodule MoviesApiWeb.Router do
  use MoviesApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MoviesApiWeb do
    pipe_through :api
  end
end
