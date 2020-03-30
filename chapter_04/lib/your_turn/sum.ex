defmodule Sum do
  def up_to(n), do: sum_up_to(n, 0)
  def sum_up_to(0, acc), do: acc
  def sum_up_to(n, acc), do: sum_up_to(n - 1, n + acc)
end
