defmodule MoviesApiWeb.FilmLanguagesView do
  use MoviesApiWeb, :view
  alias MoviesApiWeb.FilmLanguagesView

  def render("index.json", %{film_languages: film_languages}) do
    %{data: render_many(film_languages, FilmLanguagesView, "film_languages.json")}
  end

  def render("show.json", %{film_languages: film_languages}) do
    %{data: render_one(film_languages, FilmLanguagesView, "film_languages.json")}
  end

  def render("film_languages.json", %{film_languages: film_languages}) do
    %{
      id: film_languages.id,
      movie_id: film_languages.film_id,
      language_id: film_languages.language_id
    }
  end
end
