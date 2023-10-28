defmodule Lasagna do
  def expected_minutes_in_oven, do: 40

  def remaining_minutes_in_oven(elapsed_minutes_in_oven), do: expected_minutes_in_oven() - elapsed_minutes_in_oven

  def preparation_time_in_minutes(number_of_layers), do: number_of_layers * 2

  def total_time_in_minutes(number_of_layers, elapsed_minutes_in_oven) do
    prep_time = preparation_time_in_minutes(number_of_layers)

    prep_time + elapsed_minutes_in_oven
  end

  def alarm, do: "Ding!"
end
