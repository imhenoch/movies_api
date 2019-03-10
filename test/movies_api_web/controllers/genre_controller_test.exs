defmodule MoviesApiWeb.GenreControllerTest do
  use MoviesApiWeb.ConnCase

  alias MoviesApi.Films
  alias MoviesApi.Films.Genre

  @create_attrs %{
    genre: "some genre"
  }
  @update_attrs %{
    genre: "some updated genre"
  }
  @invalid_attrs %{genre: nil}

  def fixture(:genre) do
    {:ok, genre} = Films.create_genre(@create_attrs)
    genre
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all genres", %{conn: conn} do
      conn = get(conn, Routes.genre_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create genre" do
    test "renders genre when data is valid", %{conn: conn} do
      conn = post(conn, Routes.genre_path(conn, :create), genre: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.genre_path(conn, :show, id))

      assert %{
               "id" => id,
               "genre" => "some genre"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.genre_path(conn, :create), genre: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update genre" do
    setup [:create_genre]

    test "renders genre when data is valid", %{conn: conn, genre: %Genre{id: id} = genre} do
      conn = put(conn, Routes.genre_path(conn, :update, genre), genre: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.genre_path(conn, :show, id))

      assert %{
               "id" => id,
               "genre" => "some updated genre"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, genre: genre} do
      conn = put(conn, Routes.genre_path(conn, :update, genre), genre: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete genre" do
    setup [:create_genre]

    test "deletes chosen genre", %{conn: conn, genre: genre} do
      conn = delete(conn, Routes.genre_path(conn, :delete, genre))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.genre_path(conn, :show, genre))
      end
    end
  end

  defp create_genre(_) do
    genre = fixture(:genre)
    {:ok, genre: genre}
  end
end
