defmodule MoviesApiWeb.RatingController do
  use MoviesApiWeb, :controller

  alias MoviesApi.Films
  alias MoviesApi.Films.Rating

  action_fallback MoviesApiWeb.FallbackController

  def index(conn, _params) do
    ratings = Films.list_ratings()
    render(conn, "index.json", ratings: ratings)
  end

  def create(conn, %{"rating" => rating_params}) do
    with {:ok, %Rating{} = rating} <- Films.create_rating(rating_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.rating_path(conn, :show, rating))
      |> render("show.json", rating: rating)
    end
  end

  def show(conn, %{"id" => id}) do
    rating = Films.get_rating!(id)
    render(conn, "show.json", rating: rating)
  end

  def update(conn, %{"id" => id, "rating" => rating_params}) do
    rating = Films.get_rating!(id)

    with {:ok, %Rating{} = rating} <- Films.update_rating(rating, rating_params) do
      render(conn, "show.json", rating: rating)
    end
  end

  def delete(conn, %{"id" => id}) do
    rating = Films.get_rating!(id)

    with {:ok, %Rating{}} <- Films.delete_rating(rating) do
      send_resp(conn, :no_content, "")
    end
  end
end
