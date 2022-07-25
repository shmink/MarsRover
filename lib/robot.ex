defmodule Robot do
  def turn_right(%{orientation: orientation} = robot) do
    case orientation do
      "N" -> %{robot | orientation: "E"}
      "E" -> %{robot | orientation: "S"}
      "S" -> %{robot | orientation: "W"}
      "W" -> %{robot | orientation: "N"}
    end
  end

  def turn_left(%{orientation: orientation} = robot) do
    case orientation do
      "N" -> %{robot | orientation: "W"}
      "E" -> %{robot | orientation: "N"}
      "S" -> %{robot | orientation: "E"}
      "W" -> %{robot | orientation: "S"}
    end
  end

  def move_forward(%{orientation: orientation, x: x, y: y} = robot) do
    %{n: n, m: m} = Agent.get(Grid, fn a -> a end)

    case orientation do
      "E" ->
        if x + 1 > m,
          do: lost(robot),
          else: %{robot | x: x + 1}

      "W" ->
        if x - 1 < 0,
          do: lost(robot),
          else: %{robot | x: x - 1}

      "N" ->
        if y + 1 > n,
          do: lost(robot),
          else: %{robot | y: y + 1}

      "S" ->
        if y - 1 < 0,
          do: lost(robot),
          else: %{robot | y: y - 1}
    end
  end

  def lost(%{orientation: orientation, x: x, y: y}) do
    IO.puts("(#{x}, #{y}, #{orientation}) LOST")
  end
end
