defmodule MoviesApi.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :name, :string
      add :duration, :integer
      add :rating_id, references(:ratings, on_delete: :nothing)

      timestamps()
    end

    create index(:movies, [:rating_id])
  end
end
