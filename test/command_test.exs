defmodule CommandTest do
  use ExUnit.Case

  test "command executer returns final result" do
    Input.grid_size("4 8") # A lost robot is dependant on grid size therefore the grid size agent needs to be active

    result = %{x: 2, y: 3, orientation: "E", commands: "LFRFF"}
    |> Command.executer()

    assert result == %{x: 4, y: 4, orientation: "E", commands: ""}
  end
end
