defmodule MoviesApi.Films.FilmLanguages do
  use Ecto.Schema
  import Ecto.Changeset

  schema "film_languages" do
    field :film_id, :id
    field :language_id, :id

    timestamps()
  end

  @doc false
  def changeset(film_languages, attrs) do
    film_languages
    |> cast(attrs, [:film_id, :language_id])
    |> validate_required([:film_id, :language_id])
  end
end
