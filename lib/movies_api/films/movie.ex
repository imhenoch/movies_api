defmodule MoviesApi.Films.Movie do
  use Ecto.Schema
  import Ecto.Changeset

  schema "movies" do
    field :duration, :integer
    field :name, :string
    field :rating_id, :id

    timestamps()
  end

  @doc false
  def changeset(movie, attrs) do
    movie
    |> cast(attrs, [:name, :duration, :rating_id])
    |> validate_required([:name, :duration])
  end
end
