defmodule MoviesApiWeb.Router do
  use MoviesApiWeb, :router
  alias MoviesApi.Guardian

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  scope "/api/v1", MoviesApiWeb do
    pipe_through :api

    post "/sign_up", UserController, :create
    post "/sign_in", UserController, :sign_in
  end

  scope "/api/v1", MoviesApiWeb do
    pipe_through [:api, :jwt_authenticated]

    get "/user", UserController, :show
    resources "/ratings", RatingController
    resources "/languages", LanguageController
  end
end
