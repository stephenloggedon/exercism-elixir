defmodule LogLevel do
  defguardp level_is_valid?(level) when is_integer(level) and level >= 0 and level <= 5

  @spec to_label(integer, boolean) :: atom
  def to_label(level, legacy?) when level_is_valid?(level) do
    cond do
      legacy? and not_supported_by_legacy?(level) -> :unknown
      level === 0 -> :trace
      level === 1 -> :debug
      level === 2 -> :info
      level === 3 -> :warning
      level === 4 -> :error
      level === 5 -> :fatal
    end
  end

  def to_label(_level, _legacy?), do: :unknown

  @spec alert_recipient(atom, boolean) :: atom
  def alert_recipient(level, legacy?), do: to_label(level, legacy?) |> get_recipient(legacy?)

  defp get_recipient(:error, _), do: :ops
  defp get_recipient(:fatal, _), do: :ops
  defp get_recipient(:unknown, true), do: :dev1
  defp get_recipient(:unknown, false), do: :dev2
  defp get_recipient(_, _), do: :false

  defp not_supported_by_legacy?(level), do: level === 0 or level > 4
end
