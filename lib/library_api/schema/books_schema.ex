defmodule MyApp.LibraryApi.BookSchema do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :title, :string
    field :author, :string
    field :year, :integer
    field :isbn, :string
    timestamps()
  end

  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author, :year, :isbn])
    |> validate_required([:title, :author])
    |> validate_length(:title, min: 3, max: 255)
    |> validate_length(:author, min: 3, max: 255)
    |> validate_format(:isbn, ~r/^[0-9]{10}(?:-[0-9]{3})?$/)
    |> unique_constraint(:isbn)
  end
end
