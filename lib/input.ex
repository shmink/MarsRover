defmodule Input do
  def parse(robot) when is_bitstring(robot) do
    [_, x, y, orientation, commands] =
      String.replace(robot, " ", "")
      |> String.split(~r/[(),]/)

    %{
      x: String.to_integer(x),
      y: String.to_integer(y),
      orientation: orientation,
      commands: commands
    }
  end

  def parse(robots) when is_list(robots), do: Enum.map(robots, &parse(&1))

  @doc """
  I used an agent process here to store the grid size. Initially the grid size
  was inside the robot map but more often than not it was redundant so I thought
  a more consistent and cleaner approach would be this one.
  """
  def grid_size(input) do
    [m, n] =
      input
      |> String.trim()
      |> String.split(~r/[ ,]/)
      |> Enum.filter(fn z -> z != "" end)

    Agent.start_link(fn -> %{m: String.to_integer(m), n: String.to_integer(n)} end, name: Grid)
  end
end
