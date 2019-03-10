defmodule MoviesApiWeb.MovieGenresControllerTest do
  use MoviesApiWeb.ConnCase

  alias MoviesApi.Films
  alias MoviesApi.Films.MovieGenres

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:movie_genres) do
    {:ok, movie_genres} = Films.create_movie_genres(@create_attrs)
    movie_genres
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all movie_genres", %{conn: conn} do
      conn = get(conn, Routes.movie_genres_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create movie_genres" do
    test "renders movie_genres when data is valid", %{conn: conn} do
      conn = post(conn, Routes.movie_genres_path(conn, :create), movie_genres: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.movie_genres_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.movie_genres_path(conn, :create), movie_genres: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update movie_genres" do
    setup [:create_movie_genres]

    test "renders movie_genres when data is valid", %{conn: conn, movie_genres: %MovieGenres{id: id} = movie_genres} do
      conn = put(conn, Routes.movie_genres_path(conn, :update, movie_genres), movie_genres: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.movie_genres_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, movie_genres: movie_genres} do
      conn = put(conn, Routes.movie_genres_path(conn, :update, movie_genres), movie_genres: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete movie_genres" do
    setup [:create_movie_genres]

    test "deletes chosen movie_genres", %{conn: conn, movie_genres: movie_genres} do
      conn = delete(conn, Routes.movie_genres_path(conn, :delete, movie_genres))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.movie_genres_path(conn, :show, movie_genres))
      end
    end
  end

  defp create_movie_genres(_) do
    movie_genres = fixture(:movie_genres)
    {:ok, movie_genres: movie_genres}
  end
end
