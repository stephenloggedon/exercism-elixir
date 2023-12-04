defmodule BasketballWebsite do
  def extract_from_path(data, path) when is_map(data) do
    parts = String.split(path, ".")
    extract_from_path(data[List.first(parts)], Enum.drop(parts, 1) |> Enum.join("."))
  end
  def extract_from_path(data, _path), do: data

  def get_in_path(data, path), do: get_in(data, String.split(path, "."))
end
