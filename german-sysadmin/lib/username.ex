defmodule Username do

  @extralatin %{
    ?_ => '_',
    ?ß => 'ss',
    ?ü => 'ue',
    ?ö => 'oe',
    ?ä => 'ae',
  }

  def sanitize(username), do: username |> Enum.reduce('', &translate/2)

  defp translate(c, acc) do
    acc ++ cond do
      c in ?a..?z -> [c]
      Map.has_key?(@extralatin, c) -> @extralatin[c]
      true -> ''
    end
  end
end
