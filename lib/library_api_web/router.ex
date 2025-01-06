defmodule LibraryApiWeb.Router do
  use LibraryApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LibraryApiWeb do
    pipe_through :api

    post "/books", BookController, :create
    get "/books/isbn/:isbn", BookController, :show
    get "/books/author/:author", BookController, :by_author
    put "/books/:id/year/:year", BookController, :update_year
  end
end
