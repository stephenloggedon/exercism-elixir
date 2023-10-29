defmodule PopCount do
  import Integer
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number), do: digits(number, 2) |> Enum.count(&(&1 === 1))
end
