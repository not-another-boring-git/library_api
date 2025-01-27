# Library API Challenge

Create a Phoenix API project for managing a library catalog.

## Challenge Tasks
Fill in these four functions:
1. Create book with validations (title & author required)
2. Get book by ISBN
3. List books by author
4. Update book's year

## Submission
1. Fork thiw repository
2. Create branch `solution`
3. Complete challenges
4. Open PR to our repository main branch

## Evaluation
- PR pass the tests.
- PR description explains implementation choices

## Hints
- Use Phoenix generators: `mix phx.gen.context Books Book` it will generate schema, context, and tests.
- Add the missing functions referenced in `lib/library_api_web/controllers/books_controller.ex` and `lib/library_api_web/controllers/books_json.ex`
- Review Phoenix context documentation for database query patterns
- Check Ecto docs for changeset validations
- Use `iex -S mix` to experiment with your implementation

For deeper learning:
https://hexdocs.pm/phoenix/contexts.html
https://hexdocs.pm/ecto/Ecto.Changeset.html

## Running the project

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
