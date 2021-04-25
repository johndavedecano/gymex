defmodule GymexWeb.PageController do
  use GymexWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
