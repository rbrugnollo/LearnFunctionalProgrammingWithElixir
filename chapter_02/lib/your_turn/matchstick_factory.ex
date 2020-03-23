defmodule MatchstickFactory do
    @boxes [
        {:big, 50},
        {:medium, 20},
        {:small, 5},
    ]

    def boxes(matchsticks) do
        Enum.reduce(@boxes, %{remaining_matchsticks: matchsticks}, &boxes/2)
    end

    defp boxes({size, qty}, acc) do
        boxes = div(acc.remaining_matchsticks, qty)
        remaining = rem(acc.remaining_matchsticks, qty)

        acc
        |> Map.put(size, boxes)
        |> Map.put(:remaining_matchsticks, remaining)
    end
end
