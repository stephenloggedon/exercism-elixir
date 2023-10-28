defmodule Darts do
  @type position :: {number, number}
  @points_center 10
  @points_mid 5
  @points_outer 1

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}), do: x * x + y * y |> :math.sqrt |> calculate_score

  defp calculate_score(t) when t <= 1, do: @points_center
  defp calculate_score(t) when t > 1 and t <= 5, do: @points_mid
  defp calculate_score(t) when t > 5 and t <= 10, do: @points_outer
  defp calculate_score(_range), do: 0
end
