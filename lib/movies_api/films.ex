defmodule MoviesApi.Films do
  @moduledoc """
  The Films context.
  """

  import Ecto.Query, warn: false
  alias MoviesApi.Repo

  alias MoviesApi.Films.Rating

  @doc """
  Returns the list of ratings.

  ## Examples

      iex> list_ratings()
      [%Rating{}, ...]

  """
  def list_ratings do
    Repo.all(Rating)
  end

  @doc """
  Gets a single rating.

  Raises `Ecto.NoResultsError` if the Rating does not exist.

  ## Examples

      iex> get_rating!(123)
      %Rating{}

      iex> get_rating!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rating!(id), do: Repo.get!(Rating, id)

  @doc """
  Creates a rating.

  ## Examples

      iex> create_rating(%{field: value})
      {:ok, %Rating{}}

      iex> create_rating(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rating(attrs \\ %{}) do
    %Rating{}
    |> Rating.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rating.

  ## Examples

      iex> update_rating(rating, %{field: new_value})
      {:ok, %Rating{}}

      iex> update_rating(rating, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_rating(%Rating{} = rating, attrs) do
    rating
    |> Rating.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Rating.

  ## Examples

      iex> delete_rating(rating)
      {:ok, %Rating{}}

      iex> delete_rating(rating)
      {:error, %Ecto.Changeset{}}

  """
  def delete_rating(%Rating{} = rating) do
    Repo.delete(rating)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rating changes.

  ## Examples

      iex> change_rating(rating)
      %Ecto.Changeset{source: %Rating{}}

  """
  def change_rating(%Rating{} = rating) do
    Rating.changeset(rating, %{})
  end

  alias MoviesApi.Films.Language

  @doc """
  Returns the list of languages.

  ## Examples

      iex> list_languages()
      [%Language{}, ...]

  """
  def list_languages do
    Repo.all(Language)
  end

  @doc """
  Gets a single language.

  Raises `Ecto.NoResultsError` if the Language does not exist.

  ## Examples

      iex> get_language!(123)
      %Language{}

      iex> get_language!(456)
      ** (Ecto.NoResultsError)

  """
  def get_language!(id), do: Repo.get!(Language, id)

  @doc """
  Creates a language.

  ## Examples

      iex> create_language(%{field: value})
      {:ok, %Language{}}

      iex> create_language(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_language(attrs \\ %{}) do
    %Language{}
    |> Language.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a language.

  ## Examples

      iex> update_language(language, %{field: new_value})
      {:ok, %Language{}}

      iex> update_language(language, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_language(%Language{} = language, attrs) do
    language
    |> Language.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Language.

  ## Examples

      iex> delete_language(language)
      {:ok, %Language{}}

      iex> delete_language(language)
      {:error, %Ecto.Changeset{}}

  """
  def delete_language(%Language{} = language) do
    Repo.delete(language)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking language changes.

  ## Examples

      iex> change_language(language)
      %Ecto.Changeset{source: %Language{}}

  """
  def change_language(%Language{} = language) do
    Language.changeset(language, %{})
  end

  alias MoviesApi.Films.Genre

  @doc """
  Returns the list of genres.

  ## Examples

      iex> list_genres()
      [%Genre{}, ...]

  """
  def list_genres do
    Repo.all(Genre)
  end

  @doc """
  Gets a single genre.

  Raises `Ecto.NoResultsError` if the Genre does not exist.

  ## Examples

      iex> get_genre!(123)
      %Genre{}

      iex> get_genre!(456)
      ** (Ecto.NoResultsError)

  """
  def get_genre!(id), do: Repo.get!(Genre, id)

  @doc """
  Creates a genre.

  ## Examples

      iex> create_genre(%{field: value})
      {:ok, %Genre{}}

      iex> create_genre(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_genre(attrs \\ %{}) do
    %Genre{}
    |> Genre.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a genre.

  ## Examples

      iex> update_genre(genre, %{field: new_value})
      {:ok, %Genre{}}

      iex> update_genre(genre, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_genre(%Genre{} = genre, attrs) do
    genre
    |> Genre.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Genre.

  ## Examples

      iex> delete_genre(genre)
      {:ok, %Genre{}}

      iex> delete_genre(genre)
      {:error, %Ecto.Changeset{}}

  """
  def delete_genre(%Genre{} = genre) do
    Repo.delete(genre)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking genre changes.

  ## Examples

      iex> change_genre(genre)
      %Ecto.Changeset{source: %Genre{}}

  """
  def change_genre(%Genre{} = genre) do
    Genre.changeset(genre, %{})
  end

  alias MoviesApi.Films.Movie

  @doc """
  Returns the list of movies.

  ## Examples

      iex> list_movies()
      [%Movie{}, ...]

  """
  def list_movies do
    Repo.all(Movie)
  end

  @doc """
  Gets a single movie.

  Raises `Ecto.NoResultsError` if the Movie does not exist.

  ## Examples

      iex> get_movie!(123)
      %Movie{}

      iex> get_movie!(456)
      ** (Ecto.NoResultsError)

  """
  def get_movie!(id), do: Repo.get!(Movie, id)

  @doc """
  Creates a movie.

  ## Examples

      iex> create_movie(%{field: value})
      {:ok, %Movie{}}

      iex> create_movie(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_movie(attrs \\ %{}) do
    %Movie{}
    |> Movie.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a movie.

  ## Examples

      iex> update_movie(movie, %{field: new_value})
      {:ok, %Movie{}}

      iex> update_movie(movie, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_movie(%Movie{} = movie, attrs) do
    movie
    |> Movie.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Movie.

  ## Examples

      iex> delete_movie(movie)
      {:ok, %Movie{}}

      iex> delete_movie(movie)
      {:error, %Ecto.Changeset{}}

  """
  def delete_movie(%Movie{} = movie) do
    Repo.delete(movie)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking movie changes.

  ## Examples

      iex> change_movie(movie)
      %Ecto.Changeset{source: %Movie{}}

  """
  def change_movie(%Movie{} = movie) do
    Movie.changeset(movie, %{})
  end

  alias MoviesApi.Films.FilmLanguages

  @doc """
  Returns the list of film_languages.

  ## Examples

      iex> list_film_languages()
      [%FilmLanguages{}, ...]

  """
  def list_film_languages do
    Repo.all(FilmLanguages)
  end

  @doc """
  Gets a single film_languages.

  Raises `Ecto.NoResultsError` if the Film languages does not exist.

  ## Examples

      iex> get_film_languages!(123)
      %FilmLanguages{}

      iex> get_film_languages!(456)
      ** (Ecto.NoResultsError)

  """
  def get_film_languages!(id), do: Repo.get!(FilmLanguages, id)

  @doc """
  Creates a film_languages.

  ## Examples

      iex> create_film_languages(%{field: value})
      {:ok, %FilmLanguages{}}

      iex> create_film_languages(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_film_languages(attrs \\ %{}) do
    %FilmLanguages{}
    |> FilmLanguages.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a film_languages.

  ## Examples

      iex> update_film_languages(film_languages, %{field: new_value})
      {:ok, %FilmLanguages{}}

      iex> update_film_languages(film_languages, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_film_languages(%FilmLanguages{} = film_languages, attrs) do
    film_languages
    |> FilmLanguages.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a FilmLanguages.

  ## Examples

      iex> delete_film_languages(film_languages)
      {:ok, %FilmLanguages{}}

      iex> delete_film_languages(film_languages)
      {:error, %Ecto.Changeset{}}

  """
  def delete_film_languages(%FilmLanguages{} = film_languages) do
    Repo.delete(film_languages)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking film_languages changes.

  ## Examples

      iex> change_film_languages(film_languages)
      %Ecto.Changeset{source: %FilmLanguages{}}

  """
  def change_film_languages(%FilmLanguages{} = film_languages) do
    FilmLanguages.changeset(film_languages, %{})
  end

  alias MoviesApi.Films.MovieGenres

  @doc """
  Returns the list of movie_genres.

  ## Examples

      iex> list_movie_genres()
      [%MovieGenres{}, ...]

  """
  def list_movie_genres do
    Repo.all(MovieGenres)
  end

  @doc """
  Gets a single movie_genres.

  Raises `Ecto.NoResultsError` if the Movie genres does not exist.

  ## Examples

      iex> get_movie_genres!(123)
      %MovieGenres{}

      iex> get_movie_genres!(456)
      ** (Ecto.NoResultsError)

  """
  def get_movie_genres!(id), do: Repo.get!(MovieGenres, id)

  @doc """
  Creates a movie_genres.

  ## Examples

      iex> create_movie_genres(%{field: value})
      {:ok, %MovieGenres{}}

      iex> create_movie_genres(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_movie_genres(attrs \\ %{}) do
    %MovieGenres{}
    |> MovieGenres.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a movie_genres.

  ## Examples

      iex> update_movie_genres(movie_genres, %{field: new_value})
      {:ok, %MovieGenres{}}

      iex> update_movie_genres(movie_genres, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_movie_genres(%MovieGenres{} = movie_genres, attrs) do
    movie_genres
    |> MovieGenres.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a MovieGenres.

  ## Examples

      iex> delete_movie_genres(movie_genres)
      {:ok, %MovieGenres{}}

      iex> delete_movie_genres(movie_genres)
      {:error, %Ecto.Changeset{}}

  """
  def delete_movie_genres(%MovieGenres{} = movie_genres) do
    Repo.delete(movie_genres)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking movie_genres changes.

  ## Examples

      iex> change_movie_genres(movie_genres)
      %Ecto.Changeset{source: %MovieGenres{}}

  """
  def change_movie_genres(%MovieGenres{} = movie_genres) do
    MovieGenres.changeset(movie_genres, %{})
  end
end
