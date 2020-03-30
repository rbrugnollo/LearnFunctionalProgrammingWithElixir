defmodule Math do
  def sum(list), do: calc_sum(list, 0)
  defp calc_sum([], acc), do: acc
  defp calc_sum([head | tail], acc), do: calc_sum(tail, head + acc)
end
