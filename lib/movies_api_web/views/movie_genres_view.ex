defmodule MoviesApiWeb.MovieGenresView do
  use MoviesApiWeb, :view
  alias MoviesApiWeb.MovieGenresView

  def render("index.json", %{movie_genres: movie_genres}) do
    %{data: render_many(movie_genres, MovieGenresView, "movie_genres.json")}
  end

  def render("show.json", %{movie_genres: movie_genres}) do
    %{data: render_one(movie_genres, MovieGenresView, "movie_genres.json")}
  end

  def render("movie_genres.json", %{movie_genres: movie_genres}) do
    %{
      id: movie_genres.id,
      movie_id: movie_genres.movie_id,
      genre_id: movie_genres.genre_id
    }
  end
end
