defmodule GeneralStore do
  def test_data do
    [
      %{title: "Longsword", price: 50, magic: false},
      %{title: "Healing Potion", price: 60, magic: true},
      %{title: "Rope", price: 10, magic: false},
      %{title: "Dragon's Spear", price: 100, magic: true}
    ]
  end

  def filter_items([], _), do: []

  def filter_items([item = %{magic: item_magic} | rest], magic: filter_magic)
      when item_magic == filter_magic do
    [item | filter_items(rest, magic: filter_magic)]
  end

  def filter_items([_ | rest], magic: filter_magic) do
    filter_items(rest, magic: filter_magic)
  end
end
