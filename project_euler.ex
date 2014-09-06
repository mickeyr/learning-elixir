defmodule ProjectEuler do
    def problem_two() do
        Stream.unfold(0, &({fib_sequence(&1), &1+1}))
        |> Stream.take_while(&(&1<= 4_000_000))
        |> Stream.filter(&(rem(&1, 2) == 0))
        |> Enum.sum
    end
    
    def problem_three() do
        find_largest_prime_factor(600851475143, 2, 0)
    end
    
    defp fib_sequence(0), do: 0
    defp fib_sequence(1), do: 1
    defp fib_sequence(n), do: fib_sequence(n-2) + fib_sequence(n-1)
    
    ## Algorithm from http://math.stackexchange.com/questions/389675/largest-prime-factor-of-600851475143
    defp find_largest_prime_factor(1, _, c), do: c
    defp find_largest_prime_factor(a, b, c) when rem(a, b) == 0, do: find_largest_prime_factor(div(a, b), 2, max(b, c))
    defp find_largest_prime_factor(a, b, c), do: find_largest_prime_factor(a, b+1, c)
end
        
        