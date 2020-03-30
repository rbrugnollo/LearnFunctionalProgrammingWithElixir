defmodule Sort do
  def desc([]), do: []
  def desc([a]), do: [a]

  def desc(list) do
    half = div(Enum.count(list), 2)
    {list_a, list_b} = Enum.split(list, half)

    sort(
      desc(list_a),
      desc(list_b)
    )
  end

  defp sort([], list_b), do: list_b
  defp sort(list_a, []), do: list_a

  defp sort([head_a | rest_a], list_b = [head_b | _]) when head_a >= head_b,
    do: [head_a | sort(rest_a, list_b)]

  defp sort(list_a = [head_a | _], [head_b | rest_b]) when head_a < head_b,
    do: [head_b | sort(list_a, rest_b)]
end
