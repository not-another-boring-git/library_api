defmodule LibraryApiWeb.BookController do
  use LibraryApiWeb, :controller

  alias LibraryApi.Books
  alias LibraryApiWeb.BookJson

  # Criar um livro
  def create(conn, %{"book" => book_params}) do
    case Books.create_book(book_params) do
      {:ok, book} ->
        # Retorna o livro criado em formato JSON
        conn
        |> put_status(:created)
        |> render("book.json", book: book)

      {:error, changeset} ->
        # Caso tenha erro na criação, retorna o erro
        conn
        |> put_status(:unprocessable_entity)
        |> render(LibraryApiWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end

  # Mostrar um livro por ISBN
  def show(conn, %{"isbn" => isbn}) do
    case Books.get_book_by_isbn(isbn) do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Book not found"})

      book ->
        conn
        |> render("book.json", book: book)
    end
  end

  # Buscar livros por autor
  def by_author(conn, %{"author" => author}) do
    books = Books.get_books_by_author(author)
    render(conn, "books.json", books: books)
  end

  # Atualizar o ano de publicação de um livro
  def update_year(conn, %{"id" => id, "year" => year}) do
    case Books.update_book_year(id, year) do
      {:ok, book} ->
        render(conn, "book.json", book: book)

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(LibraryApiWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
