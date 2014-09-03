defmodule Collatz do
  def of(num), do: _of(num, 1)

  def _of(num, count) when num == 1, do: count
  def _of(num, count) when rem(num, 2) == 0, do: _of(div(num, 2), count + 1)
  def _of(num, count), do: _of(num*3+1, count + 1)
end


