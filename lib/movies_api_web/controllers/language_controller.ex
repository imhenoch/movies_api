defmodule MoviesApiWeb.LanguageController do
  use MoviesApiWeb, :controller

  alias MoviesApi.Films
  alias MoviesApi.Films.Language

  action_fallback MoviesApiWeb.FallbackController

  def index(conn, _params) do
    languages = Films.list_languages()
    render(conn, "index.json", languages: languages)
  end

  def create(conn, %{"language" => language_params}) do
    with {:ok, %Language{} = language} <- Films.create_language(language_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.language_path(conn, :show, language))
      |> render("show.json", language: language)
    end
  end

  def show(conn, %{"id" => id}) do
    language = Films.get_language!(id)
    render(conn, "show.json", language: language)
  end

  def update(conn, %{"id" => id, "language" => language_params}) do
    language = Films.get_language!(id)

    with {:ok, %Language{} = language} <- Films.update_language(language, language_params) do
      render(conn, "show.json", language: language)
    end
  end

  def delete(conn, %{"id" => id}) do
    language = Films.get_language!(id)

    with {:ok, %Language{}} <- Films.delete_language(language) do
      send_resp(conn, :no_content, "")
    end
  end
end
