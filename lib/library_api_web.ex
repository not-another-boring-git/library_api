defmodule LibraryApiWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, components, channels, and so on.

  This can be used in your application as:

      use LibraryApiWeb, :controller
      use LibraryApiWeb, :view
      use LibraryApiWeb, :json

  The definitions below will be executed for every controller,
  component, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define additional modules and import
  those modules here.
  """

  def static_paths, do: ~w(assets fonts images favicon.ico robots.txt)

  def router do
    quote do
      use Phoenix.Router, helpers: false

      # Import common connection and controller functions to use in pipelines
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
    end
  end

  def controller do
    quote do
      use Phoenix.Controller,
        formats: [:html, :json],
        layouts: [html: LibraryApiWeb.Layouts]

      import Plug.Conn
      use Gettext, backend: LibraryApiWeb.Gettext

      unquote(verified_routes())
    end
  end

  def json do
    quote do
      use Phoenix.Controller,
        formats: [:json]

      import Plug.Conn
      use Gettext, backend: LibraryApiWeb.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/library_api_web/templates", namespace: LibraryApiWeb
      import Phoenix.View
    end
  end

  def verified_routes do
    quote do
      use Phoenix.VerifiedRoutes,
        endpoint: LibraryApiWeb.Endpoint,
        router: LibraryApiWeb.Router,
        statics: LibraryApiWeb.static_paths()
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/live_view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
  