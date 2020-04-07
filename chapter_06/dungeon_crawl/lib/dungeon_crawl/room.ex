defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers

  import DungeonCrawl.Room.Action

  defstruct description: nil,
            actions: [],
            trigger: nil

  def all,
    do: [
      %Room{
        description: "You can see an enemy blocking your path.",
        actions: [forward()],
        trigger: Triggers.Enemy
      },
      %Room{
        description: "You can see the light of the day. You found the exit!",
        actions: [forward()],
        trigger: Triggers.Exit
      }
    ]
end
