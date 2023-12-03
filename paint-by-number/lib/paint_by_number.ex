defmodule PaintByNumber do
  def palette_bit_size(color_count), do: size_required(color_count, 1)

  defp size_required(color_count, acc) do
    cond do
      Integer.pow(2, acc) >= color_count -> acc
      true -> size_required(color_count, acc + 1)
    end
  end
  
  def empty_picture(), do: <<>>

  def test_picture(), do: <<0b0::2, 0b1::2, 0b10::2, 0b11::2>>

  def prepend_pixel("", color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count))>>
  end
  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>> 
  end

  def get_first_pixel("", _color_count), do: nil
  def get_first_pixel(picture, color_count) do
    type = palette_bit_size(color_count)
    <<idx::size(type), _value::bitstring>> = picture
    idx
  end

  def drop_first_pixel("", _color_count), do: <<>>
  def drop_first_pixel(picture, color_count) do
    type = palette_bit_size(color_count)
    <<_idx::size(type), value::bitstring>> = picture
    <<value::bitstring>>
  end

  def concat_pictures("", ""), do: <<>>
  def concat_pictures("", picture2), do: picture2
  def concat_pictures(picture1, ""), do: picture1
  def concat_pictures(picture1, picture2), do: <<picture1::bitstring, picture2::bitstring>>
end
