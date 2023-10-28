defmodule CollatzConjecture do
  import Bitwise

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) and input > 0, do: safe_calc(input)

  defp safe_calc(input) when input ===  1, do: 0
  defp safe_calc(input) when rem(input, 2) == 0, do: 1 + calc(input >>> 1)
  defp safe_calc(input), do: 1 + calc(input * 3 + 1)
end
