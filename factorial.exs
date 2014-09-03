defmodule Factorial do
  def of(n) when n >= 0 do
    _fact(n, 1)
  end

  defp _fact(0, acc), do: acc
  defp _fact(n, acc), do: _fact(n-1, acc*n)
end
