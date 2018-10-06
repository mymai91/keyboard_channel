defmodule KeyboardWeb.PageController do
  use KeyboardWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
