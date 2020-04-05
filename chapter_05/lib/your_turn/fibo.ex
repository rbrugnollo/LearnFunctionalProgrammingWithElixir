defmodule Fibonacci do
  def sequence(n) do
    Stream.unfold({0, 1}, fn
      {n1, n2} -> {n1, {n2, n1 + n2}}
    end)
    |> Enum.take(n)
  end
end
