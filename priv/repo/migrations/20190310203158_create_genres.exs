defmodule MoviesApi.Repo.Migrations.CreateGenres do
  use Ecto.Migration

  def change do
    create table(:genres) do
      add :genre, :string

      timestamps()
    end

    create unique_index(:genres, [:genre])
  end
end
