defmodule HighScore do
  @initial_score 0

  def new(), do: %{}

  def add_player(scores, name, score \\ @initial_score), do: Map.merge(scores, %{name => score})

  def remove_player(scores, name), do: Map.pop(scores, name) |> elem(1)

  def reset_score(scores, name), do: add_player(scores, name)

  def update_score(scores, name, score), do: Map.update(scores, name, score, &(&1 + score))

  def get_players(scores), do: scores |> Map.keys
end
