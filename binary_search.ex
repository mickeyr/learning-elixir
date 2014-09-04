defmodule BinarySearch do
  def find(list, value) do
    _find(list, value, 0)
  end

  defp _find([h|_], value, iterations) when h == value, do: %{:value => h, :iterations => iterations}
  defp _find([], _value, _iterations), do: :not_found
  defp _find([_h|[]], _value, _iterations), do: :not_found
  defp _find(list, value, iterations) do
    list
    |> _split_list
    |> _pick_split(value)
    |> _find(value, iterations + 1)
  end

  defp _split_list(list) do
    count = Enum.count(list)
    Enum.split(list, div(count, 2))
  end

  defp _pick_split({left_split,  [h|_]}, value) when value < h, do: left_split
  defp _pick_split({_, right_split}, _value), do: right_split
end
