defmodule BreadthNavigator do
  @max 2

  def navigate(dir) do
    expanded_dir = Path.expand(dir)
    go_through([expanded_dir], 1)
  end

  defp go_through([], _), do: nil
  defp go_through(_, current) when current > @max, do: nil

  defp go_through([content | rest], current) do
    print_and_navigate(content, is_dir: File.dir?(content))
    go_through(rest, current + 1)
  end

  defp print_and_navigate(_, is_dir: false), do: nil

  defp print_and_navigate(dir, is_dir: true) do
    dir
    |> print()
    |> File.ls!()
    |> expand_dirs(dir)
    |> go_through(1)
  end

  defp print(dir) do
    IO.puts(dir)
    dir
  end

  defp expand_dirs([], _relative_to), do: []

  defp expand_dirs([dir | rest], relative_to) do
    expanded_dir = Path.expand(dir, relative_to)
    [expanded_dir | expand_dirs(rest, relative_to)]
  end
end
