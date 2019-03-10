defmodule MoviesApiWeb.RatingView do
  use MoviesApiWeb, :view
  alias MoviesApiWeb.RatingView

  def render("index.json", %{ratings: ratings}) do
    %{data: render_many(ratings, RatingView, "rating.json")}
  end

  def render("show.json", %{rating: rating}) do
    %{data: render_one(rating, RatingView, "rating.json")}
  end

  def render("rating.json", %{rating: rating}) do
    %{id: rating.id,
      rating: rating.rating}
  end
end
