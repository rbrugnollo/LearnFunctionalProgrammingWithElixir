defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start do
    Shell.cmd("cls")
    Shell.info("Start by choosing your hero")

    heroes = DungeonCrawl.Heroes.all()

    find_hero_by_index = &Enum.at(heroes, &1)

    DungeonCrawl.Heroes.all()
    |> ask_for_option
    |> confirm_hero()
  end

  defp confirm_hero(hero) do
    Shell.cmd("cls")
    Shell.info("#{hero.description}")

    if Shell.yes?("Confirm?"), do: hero, else: start()
  end
end
