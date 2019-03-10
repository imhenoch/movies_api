defmodule MoviesApiWeb.FilmLanguagesController do
  use MoviesApiWeb, :controller

  alias MoviesApi.Films
  alias MoviesApi.Films.FilmLanguages

  action_fallback MoviesApiWeb.FallbackController

  def index(conn, _params) do
    film_languages = Films.list_film_languages()
    render(conn, "index.json", film_languages: film_languages)
  end

  def create(conn, %{"movie_languages" => film_languages_params}) do
    with {:ok, %FilmLanguages{} = film_languages} <-
           Films.create_film_languages(film_languages_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.film_languages_path(conn, :show, film_languages))
      |> render("show.json", film_languages: film_languages)
    end
  end

  def show(conn, %{"id" => id}) do
    film_languages = Films.get_film_languages!(id)
    render(conn, "show.json", film_languages: film_languages)
  end

  def update(conn, %{"id" => id, "movie_languages" => film_languages_params}) do
    film_languages = Films.get_film_languages!(id)

    with {:ok, %FilmLanguages{} = film_languages} <-
           Films.update_film_languages(film_languages, film_languages_params) do
      render(conn, "show.json", film_languages: film_languages)
    end
  end

  def delete(conn, %{"id" => id}) do
    film_languages = Films.get_film_languages!(id)

    with {:ok, %FilmLanguages{}} <- Films.delete_film_languages(film_languages) do
      send_resp(conn, :no_content, "")
    end
  end
end
