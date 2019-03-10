defmodule MoviesApiWeb.FilmLanguagesControllerTest do
  use MoviesApiWeb.ConnCase

  alias MoviesApi.Films
  alias MoviesApi.Films.FilmLanguages

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:film_languages) do
    {:ok, film_languages} = Films.create_film_languages(@create_attrs)
    film_languages
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all film_languages", %{conn: conn} do
      conn = get(conn, Routes.film_languages_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create film_languages" do
    test "renders film_languages when data is valid", %{conn: conn} do
      conn = post(conn, Routes.film_languages_path(conn, :create), film_languages: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.film_languages_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.film_languages_path(conn, :create), film_languages: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update film_languages" do
    setup [:create_film_languages]

    test "renders film_languages when data is valid", %{conn: conn, film_languages: %FilmLanguages{id: id} = film_languages} do
      conn = put(conn, Routes.film_languages_path(conn, :update, film_languages), film_languages: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.film_languages_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, film_languages: film_languages} do
      conn = put(conn, Routes.film_languages_path(conn, :update, film_languages), film_languages: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete film_languages" do
    setup [:create_film_languages]

    test "deletes chosen film_languages", %{conn: conn, film_languages: film_languages} do
      conn = delete(conn, Routes.film_languages_path(conn, :delete, film_languages))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.film_languages_path(conn, :show, film_languages))
      end
    end
  end

  defp create_film_languages(_) do
    film_languages = fixture(:film_languages)
    {:ok, film_languages: film_languages}
  end
end
