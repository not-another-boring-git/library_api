defmodule LibraryApiWeb.BookController do
  use LibraryApiWeb, :controller
  alias LibraryApi.Books

  def create(conn, %{"book" => book_params}) do
    with {:ok, book} <- Books.create_book(book_params) do
      conn
      |> put_status(:created)
      |> render(:show, book: book)
    end
  end

  def show(conn, %{"isbn" => isbn}) do
    with {:ok, book} <- Books.get_book_by_isbn(isbn) do
      render(conn, :show, book: book)
    end
  end

  def by_author(conn, %{"author" => author}) do
    books = Books.list_books_by_author(author)
    render(conn, :index, books: books)
  end

  def update_year(conn, %{"id" => id, "year" => year}) do
    with {:ok, book} <- Books.update_book_year(id, year) do
      render(conn, :show, book: book)
    end
  end
end
