defmodule MoviesApi.Films.Rating do
  use Ecto.Schema
  import Ecto.Changeset


  schema "ratings" do
    field :rating, :string

    timestamps()
  end

  @doc false
  def changeset(rating, attrs) do
    rating
    |> cast(attrs, [:rating])
    |> validate_required([:rating])
    |> unique_constraint(:rating)
  end
end
