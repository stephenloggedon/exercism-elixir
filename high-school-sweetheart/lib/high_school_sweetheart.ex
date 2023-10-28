defmodule HighSchoolSweetheart do
  def first_letter(name), do: name |> String.trim |> String.first

  def initial(name), do: "#{name |> first_letter |> String.upcase}."

  def initials(full_name) do
    "#{full_name |> initial} #{full_name |> String.split(~r/\s/) |> List.last |> initial}"
  end

  def pair(full_name1, full_name2) do
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{initials(full_name1)}  +  #{initials(full_name2)}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """

  end
end
