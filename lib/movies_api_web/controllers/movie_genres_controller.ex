defmodule MoviesApiWeb.MovieGenresController do
  use MoviesApiWeb, :controller

  alias MoviesApi.Films
  alias MoviesApi.Films.MovieGenres

  action_fallback MoviesApiWeb.FallbackController

  def index(conn, _params) do
    movie_genres = Films.list_movie_genres()
    render(conn, "index.json", movie_genres: movie_genres)
  end

  def create(conn, %{"movie_genres" => movie_genres_params}) do
    with {:ok, %MovieGenres{} = movie_genres} <- Films.create_movie_genres(movie_genres_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.movie_genres_path(conn, :show, movie_genres))
      |> render("show.json", movie_genres: movie_genres)
    end
  end

  def show(conn, %{"id" => id}) do
    movie_genres = Films.get_movie_genres!(id)
    render(conn, "show.json", movie_genres: movie_genres)
  end

  def update(conn, %{"id" => id, "movie_genres" => movie_genres_params}) do
    movie_genres = Films.get_movie_genres!(id)

    with {:ok, %MovieGenres{} = movie_genres} <- Films.update_movie_genres(movie_genres, movie_genres_params) do
      render(conn, "show.json", movie_genres: movie_genres)
    end
  end

  def delete(conn, %{"id" => id}) do
    movie_genres = Films.get_movie_genres!(id)

    with {:ok, %MovieGenres{}} <- Films.delete_movie_genres(movie_genres) do
      send_resp(conn, :no_content, "")
    end
  end
end
