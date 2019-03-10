defmodule MoviesApiWeb.MovieView do
  use MoviesApiWeb, :view
  alias MoviesApiWeb.MovieView

  def render("index.json", %{movies: movies}) do
    %{data: render_many(movies, MovieView, "movie.json")}
  end

  def render("show.json", %{movie: movie}) do
    %{data: render_one(movie, MovieView, "movie.json")}
  end

  def render("movie.json", %{movie: movie}) do
    %{id: movie.id, name: movie.name, duration: movie.duration, rating_id: movie.rating_id}
  end
end
