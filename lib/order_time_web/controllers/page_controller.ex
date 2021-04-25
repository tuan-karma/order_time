defmodule OrderTimeWeb.PageController do
  use OrderTimeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
