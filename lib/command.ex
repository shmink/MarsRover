defmodule Command do
  def executer(%{commands: commands, orientation: orientation, x: x, y: y} = robot) do
    case commands do
      "" ->
        IO.puts("(#{x}, #{y}, #{orientation})")
        # Needed for testing, not logic
        %{x: x, y: y, orientation: orientation, commands: commands}

      "L" <> rest ->
        Robot.turn_left(%{robot | commands: rest})
        |> executer()

      "R" <> rest ->
        Robot.turn_right(%{robot | commands: rest})
        |> executer()

      "F" <> rest ->
        Robot.move_forward(%{robot | commands: rest})
        |> executer()

      _ ->
        IO.puts("There was an error of some kind")
    end
  end

  def executer([%{} | _] = robots), do: Enum.map(robots, &executer(&1))

  def executer(:ok) do
  end
end
