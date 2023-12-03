defmodule DNA do
  @code %{
    ?\s => 0b0000,
    ?A  => 0b0001,
    ?C  => 0b0010,
    ?G  => 0b0100,
    ?T  => 0b1000, 
  }

  def encode_nucleotide(code_point), do: Map.get(@code, code_point)

  def decode_nucleotide(encoded_code), do: Map.new(@code, fn {k, v} -> {v, k} end)[encoded_code]

  def encode(dna), do: do_encode(dna, <<>>)
  defp do_encode([], acc), do: acc
  defp do_encode([first | rest], acc), do: do_encode(rest, <<acc::bitstring, <<encode_nucleotide(first)::4>>::bitstring>>)

  def decode(dna), do: do_decode(dna, [])
  defp do_decode(<<>>, acc), do: acc
  defp do_decode(<<first::4, rest::bitstring>>, acc), do: do_decode(rest, acc ++ [decode_nucleotide(first)])
end
