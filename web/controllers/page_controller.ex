defmodule Ssa.PageController do
  use Ssa.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
