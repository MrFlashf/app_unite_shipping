defmodule ShippingWebWeb.Router do
  use ShippingWebWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ShippingWebWeb do
    pipe_through :api

    scope "/driver" do
      # send load requests
      # pick up load
      # change vehicle position
      # deliver load
    end

    scope "/shipper" do
      # create_load
      # accept load request
      # complete load
      # cancel load
    end
  end
end
