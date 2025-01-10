defmodule LibraryApi.Books do
  alias LibraryApi.Repo
  alias LibraryApi.Books.Book

  # Função para criar um livro com validação de título e autor
  def create(attrs) do
    %Book{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end

  # Função para obter um livro pelo ISBN
  def get_by_isbn(isbn) do
    Repo.get_by(Book, isbn: isbn)
  end

  # Função para listar livros por autor
  def list_by_author(author) do
    Repo.all(from b in Book, where: b.author == ^author)
  end

  # Função para atualizar o ano de um livro
  def update_year(id, new_year) do
    book = get(id)

    case book do
      nil -> {:error, "Book not found"}
      _book -> 
        book
        |> Book.changeset(%{year: new_year})
        |> Repo.update()
    end
  end

  # Função para obter um livro por id
  def get(id) do
    Repo.get(Book, id)
  end
end
