defmodule MyEnum do
  def all?(list, fun \\ fn x -> x end)
  def all?([], fun), do: true
  def all?([head|tail], fun), do: fun.(head) && all?(tail, fun) 

  def each([], fun), do: :ok
    
  def each([head|tail], fun) do
    fun.(head)
    each(tail, fun)
  end

  def filter([], fun), do: []

  def filter([head | tail], fun) do
    if fun.(head) do
      [head | filter(tail, fun)]
    else
      filter(tail, fun)
    end
  end

  def flatten([]), do: []
  def flatten([head | tail]) when is_list(head), do: [flatten(head) | flatten(tail)]
  def flatten(head), do: [head]
end
