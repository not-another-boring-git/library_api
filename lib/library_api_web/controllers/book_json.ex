defmodule LibraryApiWeb.BookJSON do
  use LibraryApiWeb, :view

  def render("book.json", %{book: book}) do
    %{
      id: book.id,
      title: book.title,
      author: book.author,
      year: book.year,
      isbn: book.isbn,
      inserted_at: book.inserted_at,
      updated_at: book.updated_at
    }
  end
end
