defmodule WineCellar do
  @description [
    white: "Fermented without skin contact.",
    red: "Fermented with skin contact using dark-colored grapes.",
    rose: "Fermented with some skin contact, but not enough to qualify as a red wine.",
  ]

  def explain_colors, do: @description

  def filter(cellar, color, opts \\ []) do
    cellar
    |> Keyword.get_values(color)
    |> filter_optionally(Keyword.get_values(opts, :year), &filter_by_year/2)
    |> filter_optionally(Keyword.get_values(opts, :country), &filter_by_country/2)
  end

  defp filter_optionally(wines, [], _), do: wines
  defp filter_optionally(wines, by_values, func), do: Enum.reduce(by_values, [], &(&2 ++ func.(wines, &1)))

  # The functions below do not need to be modified.

  defp filter_by_year(wines_by_color, year)
  defp filter_by_year(wines_by_color, year) when is_nil(year), do: wines_by_color
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines_by_color, country)
  defp filter_by_country(wines_by_color, country) when is_nil(country), do: wines_by_color
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
