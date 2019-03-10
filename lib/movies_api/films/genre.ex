defmodule MoviesApi.Films.Genre do
  use Ecto.Schema
  import Ecto.Changeset


  schema "genres" do
    field :genre, :string

    timestamps()
  end

  @doc false
  def changeset(genre, attrs) do
    genre
    |> cast(attrs, [:genre])
    |> validate_required([:genre])
    |> unique_constraint(:genre)
  end
end
