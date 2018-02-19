defmodule ShippingWebWeb.DriverView do
  use ShippingWebWeb, :view

  alias ShippingWebWeb.DriverView

  def render("show.json", %{load: load}) do
    %{data: render_one(load, DriverView, "load.json")}
  end

  def render("load.json", %{driver: load}) do
    %{
      uuid: load.uuid,
      shipper_id: load.shipper_id,
      car_type: load.car_type,
      delivered: load.delivered,
      driver_requests: load.driver_requests,
      lat: load.lat,
      lng: load.lng,
      number_of_trips: load.number_of_trips,
      picked_up: render_one(load.picked_up, DriverView, "picked_up"),
      start_date_millis: load.start_date_millis,
    }
  end

  def render("picked_up", %{driver: picked_up}) do
    IO.inspect picked_up
    case picked_up do
      nil ->
        nil
      [picked_up | nil] ->
        %{
          driver_id: picked_up.driver_id,
          load_id: picked_up.load_id,
          load_request_id: picked_up.load_request_id,
          timestamp: picked_up.timestamp,
          uuid: picked_up.uuid
        }
    end
  end
end
