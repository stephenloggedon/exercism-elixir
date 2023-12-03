defmodule FileSniffer do

  @ext_to_mime %{
    "exe" => "application/octet-stream",
    "bmp" => "image/bmp",
    "png" => "image/png",
    "jpg" => "image/jpg",
    "gif" => "image/gif",
  }

  def type_from_extension(extension), do: Map.get(@ext_to_mime, extension)

  def type_from_binary(<<0x7F, 0x45, 0x4C, 0x46, _rest::binary>>), do: type_from_extension("exe")
  def type_from_binary(<<0x42, 0x4D, _rest::binary>>), do: type_from_extension("bmp")
  def type_from_binary(<<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _rest::binary>>), do: type_from_extension("png")
  def type_from_binary(<<0xFF, 0xD8, 0xFF, _rest::binary>>), do: type_from_extension("jpg")
  def type_from_binary(<<0x47, 0x49, 0x46, _rest::binary>>), do: type_from_extension("gif")
  def type_from_binary(_binary), do: nil

  def verify(file_binary, extension) do
    mime = type_from_binary(file_binary)
    ext = Map.new(@ext_to_mime, fn {k,v} -> {v, k} end) |> Map.get(mime)
    
    cond do
      ext == extension -> {:ok, mime}
      true -> {:error, "Warning, file format and file extension do not match."}
    end
  end
end
