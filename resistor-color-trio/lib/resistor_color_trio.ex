defmodule ResistorColorTrio do
  require Integer
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """

  @color_table %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9,
  }

  @kilo 1_000
  @mega 1_000_000
  @giga 1_000_000_000

  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([first, second, third | _]) do
    as_number = [@color_table[first], @color_table[second] | List.duplicate(0, @color_table[third])] |> Integer.undigits

    cond do
      as_number > @giga -> {as_number / @giga, :gigaohms}
      as_number > @mega -> {as_number / @mega, :megaohms}
      as_number > @kilo -> {as_number / @kilo, :kiloohms}
      true -> {as_number, :ohms}
    end
  end
end
