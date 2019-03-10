defmodule MoviesApi.Repo.Migrations.CreateFilmLanguages do
  use Ecto.Migration

  def change do
    create table(:film_languages) do
      add :film_id, references(:movies, on_delete: :nothing)
      add :language_id, references(:languages, on_delete: :nothing)

      timestamps()
    end

    create index(:film_languages, [:film_id])
    create index(:film_languages, [:language_id])
  end
end
