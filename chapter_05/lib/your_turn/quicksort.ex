defmodule Quicksort do
  def sort([]), do: []


  def sort([pivot | rest]) do
    {lower, higher} = Enum.split_with(rest, &(&1 < pivot))
    sort(lower) ++ [pivot] ++ sort(higher)
  end
end
