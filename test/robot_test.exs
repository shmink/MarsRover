defmodule RobotTest do
  use ExUnit.Case

  test "moveing forward" do
    # A lost robot is dependant on grid size therefore the grid size agent needs to be active
    Input.grid_size("4 8")

    result =
      %{x: 0, y: 0, orientation: "N"}
      |> Robot.move_forward()

    assert result == %{x: 0, y: 1, orientation: "N"}
  end

  test "turning right" do
    result =
      %{orientation: "N"}
      |> Robot.turn_right()

    assert result == %{orientation: "E"}
  end

  test "turning left" do
    result =
      %{orientation: "N"}
      |> Robot.turn_left()

    assert result == %{orientation: "W"}
  end
end
