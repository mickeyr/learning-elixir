defmodule ProjectEuler do
    def problem_two() do
        transform = fn
            i when i <= 4_000_000 and rem(i, 2) == 0 -> i
            i when i <= 4_000_000 -> 0
            _ -> 0
        end
        Stream.unfold(0, &({fib_sequence(&1), &1+1}))
        |> Stream.take_while(&(&1<= 4_000_000))
        |> Stream.map(transform)
        |> Enum.sum
    end
    
    defp fib_sequence(0), do: 0
    defp fib_sequence(1), do: 1
    defp fib_sequence(n), do: fib_sequence(n-2) + fib_sequence(n-1)
end
        
        