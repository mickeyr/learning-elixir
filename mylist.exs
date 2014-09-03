defmodule MyList do
  def square([]),            do: []
  def square([head | tail]),  do: [head*head | square(tail)]
  def sum([]),    do: 0
  def sum([head|tail]), do: head + sum(tail)

  defp _mapsum([], value, _), do: value
  defp _mapsum([head|tail], value, fun) do
    value + _mapsum(tail, fun.(head), fun)
  end
  def mapsum(list, fun), do: _mapsum(list, 0, fun)

  defp _max([], max), do: max

  defp _max([head|tail], max) when head > max do
    _max(tail, head)
  end
  defp _max([head|tail], max) when head <= max do
    _max(tail, max)
  end
  
  def max(list), do: _max(list, 0) 

  def caesar([], num), do: []

  def caesar([head | tail], num) when (head + num) > ?z do
    char = head + 13
    wrapped = (?a + rem(char, ?z)) - 1
    [wrapped | caesar(tail, num)] 
  end

  def caesar([head | tail], num) do
    [head + 13 | caesar(tail, num)]
  end

  def span(from, to) when from > to,  do: []
    
  def span(from, to) do
    [from, span(from+1, to)]
  end

end
