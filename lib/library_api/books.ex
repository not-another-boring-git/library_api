defmodule LibraryApi.Books do
  alias LibraryApi.Repo
  alias LibraryApi.Books.Book

  # Função para criar um livro
  def create(attrs) do
    %Book{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end

  # Função para listar todos os livros
  def list do
    Repo.all(Book)
  end

  # Função para obter um livro pelo id
  def get(id) do
    Repo.get(Book, id)
  end

  # Função para atualizar um livro existente
  def update(id, attrs) do
    book = get(id)

    case book do
      nil -> {:error, "Book not found"}
      _book -> 
        book
        |> Book.changeset(attrs)
        |> Repo.update()
    end
  end
end
