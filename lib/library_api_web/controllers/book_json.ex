defmodule LibraryApiWeb.BookJSON do
  alias LibraryApi.Books.Book

  def index(%{books: books}) do
    %{data: for(book <- books, do: data(book))}
  end

  def show(%{book: book}) do
    data(book)
  end

  defp data(%Book{} = book) do
    %{
      id: book.id,
      title: book.title,
      author: book.author,
      year: book.year,
      isbn: book.isbn
    }
  end
end
