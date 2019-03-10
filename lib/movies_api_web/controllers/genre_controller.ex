defmodule MoviesApiWeb.GenreController do
  use MoviesApiWeb, :controller

  alias MoviesApi.Films
  alias MoviesApi.Films.Genre

  action_fallback MoviesApiWeb.FallbackController

  def index(conn, _params) do
    genres = Films.list_genres()
    render(conn, "index.json", genres: genres)
  end

  def create(conn, %{"genre" => genre_params}) do
    with {:ok, %Genre{} = genre} <- Films.create_genre(genre_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.genre_path(conn, :show, genre))
      |> render("show.json", genre: genre)
    end
  end

  def show(conn, %{"id" => id}) do
    genre = Films.get_genre!(id)
    render(conn, "show.json", genre: genre)
  end

  def update(conn, %{"id" => id, "genre" => genre_params}) do
    genre = Films.get_genre!(id)

    with {:ok, %Genre{} = genre} <- Films.update_genre(genre, genre_params) do
      render(conn, "show.json", genre: genre)
    end
  end

  def delete(conn, %{"id" => id}) do
    genre = Films.get_genre!(id)

    with {:ok, %Genre{}} <- Films.delete_genre(genre) do
      send_resp(conn, :no_content, "")
    end
  end
end
