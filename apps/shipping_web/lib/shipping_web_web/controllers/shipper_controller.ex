defmodule ShippingWebWeb.ShiperController do
  use ShippingWebWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
