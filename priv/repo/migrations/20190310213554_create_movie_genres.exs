defmodule MoviesApi.Repo.Migrations.CreateMovieGenres do
  use Ecto.Migration

  def change do
    create table(:movie_genres) do
      add :movie_id, references(:movies, on_delete: :nothing)
      add :genre_id, references(:genres, on_delete: :nothing)

      timestamps()
    end

    create index(:movie_genres, [:movie_id])
    create index(:movie_genres, [:genre_id])
  end
end
