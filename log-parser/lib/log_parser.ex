defmodule LogParser do
  def valid_line?(line), do: line =~ ~r/^\[DEBUG|WARNING|INFO|ERROR\]/

  def split_line(line), do: Regex.split(~r/<[\*~=-]*>/, line)

  def remove_artifacts(line), do: Regex.replace(~r/end-of-line[0-9]+/i, line, "")

  def tag_with_user_name(line) do
    capture = Regex.run(~r/User\s+[[:graph:]]+\s*/u, line)

   cond do
     is_nil(capture) -> line
     true -> String.replace(sanitize_string(List.first(capture)), "User", "[USER]") <> " " <> line
   end
  end

  defp sanitize_string(string), do: String.replace(string, ~r/[[:cntrl:]]+/u, " ") |> remove_repeated_whitespace
  defp remove_repeated_whitespace(string), do: Regex.replace(~r/\s+/, string, " ") |> String.trim(" ")
end
