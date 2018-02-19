defmodule ShippingWebWeb.DriverController do
  use ShippingWebWeb, :controller

  alias Shipping.Shipper.Load
  alias Shipping.Shipper
  alias Shipping.Driver.Events.{LoadRequestSent, LoadPickedUp}


  @load %{
    uuid: "uuid",
    shipper_id: "shiper_id",
    number_of_trips: "number_of_trips",
    car_type: "car type",
    start_date_millis: "start_date",
    lat: "lat",
    lng: "lng"
  }

  @load_request_sent %{
    uuid: nil,
    driver_id: nil,
    load_id: nil,
    timestamp: nil
  }

  @load_picked_up [:uuid, :load_request_id, :driver_id, :load_id, :timestamp]


  def send_load_request(conn, params) do
    load = struct(Load, @load)
    load_request = struct(LoadRequestSent, %{uuid: params["uuid"], driver_id: params["driver_id"], load_id: params["load_id"], timestamp: params["timestamp"]})
    {events, load} = Shipper.handle_load_request(load, load_request)
    render conn, "show.json", load: load
  end

  def pick_up_load(conn, params) do
    load = struct(Load, @load)
    load_picked_up = struct(LoadPickedUp, %{uuid: params["uuid"], load_request_id: params["load_request_id"], driver_id: params["driver_id"], load_id: params["load_id"], timestamp: params["timestamp"]})
    {events, load} = Shipper.handle_load_pickup(load, load_picked_up)
    render conn, "show.json", load: load
  end

  def change_vehicle_position(conn, params) do

  end

  def deliver_load(conn, params) do

  end
end
