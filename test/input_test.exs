defmodule InputTest do
  use ExUnit.Case

  test "parse robot input" do
    result =
      "(2, 3, E) LFRFF"
      |> Input.parse()

    assert result == %{x: 2, y: 3, orientation: "E", commands: "LFRFF"}
  end

  test "parse multiple robot inputs" do
    result =
      ["(2, 3, E) LFRFF", "(0, 2, N) FFLFRFF"]
      |> Input.parse()

    assert result == [%{x: 2, y: 3, orientation: "E", commands: "LFRFF"}, %{x: 0, y: 2, orientation: "N", commands: "FFLFRFF"}]
  end

  test "grid size agent persists" do
    Input.grid_size("4 8")

    assert Agent.get(Grid, fn a -> a end) == %{m: 4, n: 8}
  end
end
