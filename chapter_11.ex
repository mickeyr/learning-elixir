defmodule Chapter11 do
  def  is_printable(string),  do: _is_printable(string)
  defp _is_printable(char) when is_integer(char), do: char >=32 && char <= 126
  defp _is_printable([]),    do: true
  defp _is_printable([h|t]), do: _is_printable(h) && _is_printable(t)

  defp normalize_list(character_list) when is_list(character_list) do
    character_list
    |> Enum.filter(&(is_printable(&1)))
    |> Enum.sort
  end
  defp normalize_list(string) do
    string
    |> to_char_list
    |> normalize_list
  end

  def is_anagaram(string1, string2) do
    normalize_list(string1) == normalize_list(string2)
  end

  def calculate(string) do
    _calculate(string, [])
  end

  defp _char_list_to_integer(list), do: list |> to_string |> String.strip |> String.to_integer

  defp _calculate([?+ | tail], lhs) do
    rhs = _char_list_to_integer(tail)
    lhs = _char_list_to_integer(lhs)
    lhs + rhs
  end
  defp _calculate([?- | tail], lhs) do
    rhs = _char_list_to_integer(tail)
    lhs = _char_list_to_integer(lhs)
    lhs - rhs
  end
  defp _calculate([?* | tail], lhs) do
    rhs = _char_list_to_integer(tail)
    lhs = _char_list_to_integer(lhs)
    lhs * rhs
  end
  defp _calculate([?/ | tail], lhs) do
    rhs = _char_list_to_integer(tail)
    lhs = _char_list_to_integer(lhs)
    lhs / rhs
  end
  defp _calculate([head | tail], lhs) do
   _calculate(tail, [head] ++ lhs) 
  end
end
