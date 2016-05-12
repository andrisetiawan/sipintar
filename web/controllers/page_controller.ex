defmodule Sipintar.PageController do
  use Sipintar.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
