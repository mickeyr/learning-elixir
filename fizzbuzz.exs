fizz_buzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, c -> c
end

test = fn num ->
  fizz_buzz.(rem(num, 3), rem(num, 5), num)
end

IO.puts test.(10)
IO.puts test.(11)
IO.puts test.(12)
IO.puts test.(13)
IO.puts test.(14)
IO.puts test.(15)
IO.puts test.(16)
