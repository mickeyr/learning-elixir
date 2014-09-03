defmodule MyString do
  def  reverse(string),                do: string |> to_char_list |> _reverse([]) |> to_string
  defp _reverse([head|[]], current),   do: [head] ++ current
  defp _reverse([head|tail], current), do: _reverse(tail, [head] ++ current)

  def is_palindrome(string) do 
    stripped = Regex.replace(~r/[^a-zA-Z]/, string, "") |> String.downcase
    stripped == reverse(stripped)
  end
end
