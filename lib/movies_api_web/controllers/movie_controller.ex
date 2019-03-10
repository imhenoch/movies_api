defmodule MoviesApiWeb.MovieController do
  use MoviesApiWeb, :controller

  alias MoviesApi.Films
  alias MoviesApi.Films.Movie

  action_fallback MoviesApiWeb.FallbackController

  def index(conn, _params) do
    movies = Films.list_movies()
    render(conn, "index.json", movies: movies)
  end

  def create(conn, %{"movie" => movie_params}) do
    with {:ok, %Movie{} = movie} <- Films.create_movie(movie_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.movie_path(conn, :show, movie))
      |> render("show.json", movie: movie)
    end
  end

  def show(conn, %{"id" => id}) do
    movie = Films.get_movie!(id)
    render(conn, "show.json", movie: movie)
  end

  def update(conn, %{"id" => id, "movie" => movie_params}) do
    movie = Films.get_movie!(id)

    with {:ok, %Movie{} = movie} <- Films.update_movie(movie, movie_params) do
      render(conn, "show.json", movie: movie)
    end
  end

  def delete(conn, %{"id" => id}) do
    movie = Films.get_movie!(id)

    with {:ok, %Movie{}} <- Films.delete_movie(movie) do
      send_resp(conn, :no_content, "")
    end
  end
end
