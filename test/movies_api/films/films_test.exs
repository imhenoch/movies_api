defmodule MoviesApi.FilmsTest do
  use MoviesApi.DataCase

  alias MoviesApi.Films

  describe "ratings" do
    alias MoviesApi.Films.Rating

    @valid_attrs %{rating: "some rating"}
    @update_attrs %{rating: "some updated rating"}
    @invalid_attrs %{rating: nil}

    def rating_fixture(attrs \\ %{}) do
      {:ok, rating} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Films.create_rating()

      rating
    end

    test "list_ratings/0 returns all ratings" do
      rating = rating_fixture()
      assert Films.list_ratings() == [rating]
    end

    test "get_rating!/1 returns the rating with given id" do
      rating = rating_fixture()
      assert Films.get_rating!(rating.id) == rating
    end

    test "create_rating/1 with valid data creates a rating" do
      assert {:ok, %Rating{} = rating} = Films.create_rating(@valid_attrs)
      assert rating.rating == "some rating"
    end

    test "create_rating/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Films.create_rating(@invalid_attrs)
    end

    test "update_rating/2 with valid data updates the rating" do
      rating = rating_fixture()
      assert {:ok, %Rating{} = rating} = Films.update_rating(rating, @update_attrs)
      assert rating.rating == "some updated rating"
    end

    test "update_rating/2 with invalid data returns error changeset" do
      rating = rating_fixture()
      assert {:error, %Ecto.Changeset{}} = Films.update_rating(rating, @invalid_attrs)
      assert rating == Films.get_rating!(rating.id)
    end

    test "delete_rating/1 deletes the rating" do
      rating = rating_fixture()
      assert {:ok, %Rating{}} = Films.delete_rating(rating)
      assert_raise Ecto.NoResultsError, fn -> Films.get_rating!(rating.id) end
    end

    test "change_rating/1 returns a rating changeset" do
      rating = rating_fixture()
      assert %Ecto.Changeset{} = Films.change_rating(rating)
    end
  end

  describe "languages" do
    alias MoviesApi.Films.Language

    @valid_attrs %{language: "some language"}
    @update_attrs %{language: "some updated language"}
    @invalid_attrs %{language: nil}

    def language_fixture(attrs \\ %{}) do
      {:ok, language} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Films.create_language()

      language
    end

    test "list_languages/0 returns all languages" do
      language = language_fixture()
      assert Films.list_languages() == [language]
    end

    test "get_language!/1 returns the language with given id" do
      language = language_fixture()
      assert Films.get_language!(language.id) == language
    end

    test "create_language/1 with valid data creates a language" do
      assert {:ok, %Language{} = language} = Films.create_language(@valid_attrs)
      assert language.language == "some language"
    end

    test "create_language/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Films.create_language(@invalid_attrs)
    end

    test "update_language/2 with valid data updates the language" do
      language = language_fixture()
      assert {:ok, %Language{} = language} = Films.update_language(language, @update_attrs)
      assert language.language == "some updated language"
    end

    test "update_language/2 with invalid data returns error changeset" do
      language = language_fixture()
      assert {:error, %Ecto.Changeset{}} = Films.update_language(language, @invalid_attrs)
      assert language == Films.get_language!(language.id)
    end

    test "delete_language/1 deletes the language" do
      language = language_fixture()
      assert {:ok, %Language{}} = Films.delete_language(language)
      assert_raise Ecto.NoResultsError, fn -> Films.get_language!(language.id) end
    end

    test "change_language/1 returns a language changeset" do
      language = language_fixture()
      assert %Ecto.Changeset{} = Films.change_language(language)
    end
  end
end
