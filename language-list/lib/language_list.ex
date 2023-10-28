defmodule LanguageList do
  def new(), do: []
  def add(list, language), do: [language | list]
  def remove(list) when length(list) > 0, do: tl(list)
  def first(list) when length(list) > 0, do: hd(list)
  def count(list), do: length(list)
  def functional_list?(list), do: "Elixir" in list
end
