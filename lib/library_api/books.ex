defmodule LibraryApi.Books do
  alias LibraryApi.Repo
  alias LibraryApi.Books.BookSchema

  # Create
  def create_book(attrs) do
    %BookSchema{}
    |> BookSchema.changeset(attrs)
    |> Repo.insert()
  end

  # Read
  def get_book(id), do: Repo.get(BookSchema, id)
  def list_books, do: Repo.all(BookSchema)

  # Update
  def update_book(id, attrs) do
    book = get_book(id)
    book
    |> BookSchema.changeset(attrs)
    |> Repo.update()
  end

  # Delete
  def delete_book(id) do
    book = get_book(id)
    Repo.delete(book)
  end
end
