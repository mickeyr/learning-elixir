defmodule Chop do
#  def guess(_, _, 250) do
#  end
  def guess(actual, _, guess) when actual == guess do
    IO.puts guess
  end
  def guess(actual, low..high, guess) when actual > guess do
    diff = high - guess  
    next_guess = guess + div(diff, 2) + 1
    IO.puts "Is it #{next_guess}"
    guess(actual, guess+1..high, next_guess)
  end
  def guess(actual, low..high, guess) when actual < guess do
    diff = guess - low 
    next_guess = guess - div(diff, 2) - 1
    IO.puts "Is it #{next_guess}"
    guess(actual, low..guess-1, next_guess)
  end
  def guess(actual, low..high) do
    guess = div(high, 2)
    IO.puts "Is it #{guess}"
    guess(actual, low..high, guess)
  end
end

