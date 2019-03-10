defmodule MoviesApi.Films.Language do
  use Ecto.Schema
  import Ecto.Changeset


  schema "languages" do
    field :language, :string

    timestamps()
  end

  @doc false
  def changeset(language, attrs) do
    language
    |> cast(attrs, [:language])
    |> validate_required([:language])
    |> unique_constraint(:language)
  end
end
