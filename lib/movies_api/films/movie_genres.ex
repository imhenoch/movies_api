defmodule MoviesApi.Films.MovieGenres do
  use Ecto.Schema
  import Ecto.Changeset

  schema "movie_genres" do
    field :movie_id, :id
    field :genre_id, :id

    timestamps()
  end

  @doc false
  def changeset(movie_genres, attrs) do
    movie_genres
    |> cast(attrs, [:movie_id, :genre_id])
    |> validate_required([:movie_id, :genre_id])
  end
end
