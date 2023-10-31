defmodule BinarySearch do
  import Bitwise

  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _), do: :not_found
  def search(numbers, key), do: get_key(numbers, key, 0, tuple_size(numbers) - 1)

  defp get_key(_t, _key, start_idx, end_idx) when start_idx > end_idx, do: :not_found
  defp get_key(t, key, start_idx, end_idx) do
    mid_idx = start_idx + end_idx >>> 1
    mid_val = elem(t, mid_idx)

    cond do
      key === mid_val -> {:ok, mid_idx}
      key < mid_val -> get_key(t, key, 0, mid_idx - 1)
      key > mid_val -> get_key(t, key, mid_idx + 1, end_idx)
    end
  end
end
