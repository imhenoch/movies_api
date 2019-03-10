defmodule MoviesApi.Repo.Migrations.CreateRatings do
  use Ecto.Migration

  def change do
    create table(:ratings) do
      add :rating, :string

      timestamps()
    end

    create unique_index(:ratings, [:rating])
  end
end
