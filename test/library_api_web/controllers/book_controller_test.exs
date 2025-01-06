defmodule LibraryApiWeb.BookControllerTest do
  use LibraryApiWeb.ConnCase

  @create_attrs %{
    title: "Dune",
    author: "Frank Herbert",
    year: 1965,
    isbn: "9780441172719"
  }

  describe "create book" do
    test "creates book with valid data", %{conn: conn} do
      conn = post(conn, ~p"/api/books", book: @create_attrs)
      assert %{"id" => _id} = json_response(conn, 201)
    end

    test "returns error with invalid data", %{conn: conn} do
      conn = post(conn, ~p"/api/books", book: %{})
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "get book by isbn" do
    test "returns book when isbn exists", %{conn: conn} do
      {:ok, book} = Books.create_book(@create_attrs)
      conn = get(conn, ~p"/api/books/isbn/#{book.isbn}")
      assert json_response(conn, 200)["isbn"] == book.isbn
    end
  end

  describe "list books by author" do
    test "returns all books by author", %{conn: conn} do
      {:ok, book} = Books.create_book(@create_attrs)
      conn = get(conn, ~p"/api/books/author/#{book.author}")
      assert [book] = json_response(conn, 200)["data"]
    end
  end

  describe "update book year" do
    test "updates book year when data is valid", %{conn: conn} do
      {:ok, book} = Books.create_book(@create_attrs)
      new_year = 1966
      conn = put(conn, ~p"/api/books/#{book.id}/year", year: new_year)
      assert json_response(conn, 200)["year"] == new_year
    end
  end
end
