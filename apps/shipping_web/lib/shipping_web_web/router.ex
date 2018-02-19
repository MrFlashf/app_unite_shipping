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

    scope "/driver/:driver_id" do
      post "send-load-request", DriverController, :send_load_request
      post "pick-load/", DriverController, :pick_up_load
      post "change-vehicle-position/", DriverController, :change_vehicle_position
      post "deliver-load", DriverController, :deliver_load
    end

    scope "/shipper" do
      # create_load
      # accept load request
      # complete load
      # cancel load
    end

    scope "/tracker" do

    end
  end
end
