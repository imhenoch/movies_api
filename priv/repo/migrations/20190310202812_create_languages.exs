defmodule MoviesApi.Repo.Migrations.CreateLanguages do
  use Ecto.Migration

  def change do
    create table(:languages) do
      add :language, :string

      timestamps()
    end

    create unique_index(:languages, [:language])
  end
end
