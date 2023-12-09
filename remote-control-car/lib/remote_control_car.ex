defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [
    :nickname,
    battery_percentage: 100,
    distance_driven_in_meters: 0,
  ]

  def new(), do: %RemoteControlCar{nickname: "none"}
  def new(nickname), do: %RemoteControlCar{nickname: nickname}

  def display_distance(remote_car) when is_struct(remote_car, RemoteControlCar),
    do: to_string(remote_car.distance_driven_in_meters) <> " meters"

  def display_battery(remote_car) when is_struct(remote_car, RemoteControlCar) do
    if remote_car.battery_percentage > 0 do
      "Battery at #{remote_car.battery_percentage}%"
    else
      "Battery empty"
    end
  end

  def drive(remote_car) when is_struct(remote_car, RemoteControlCar) do
    cond do
      remote_car.battery_percentage > 0 ->
        %RemoteControlCar {
          remote_car |
          battery_percentage: remote_car.battery_percentage - 1,
          distance_driven_in_meters: remote_car.distance_driven_in_meters + 20
        }
      true -> remote_car
    end
  end
end
