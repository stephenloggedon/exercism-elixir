defmodule NameBadge do
  @sep " - "

  def print(id, name, department), do: make_id_string(id) <> name <> @sep <> make_department_string(department)

  defp make_id_string(s) do
    if is_nil(s), do: "", else: "[#{s}]" <> @sep
  end

  defp make_department_string(s) do
    if is_nil(s), do: "OWNER", else: s |> String.upcase
  end

end
