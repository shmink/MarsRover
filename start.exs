# Input.grid_size("4 8")
# Input.parse(["(2, 3, N) FLLFR", "(1, 0, S) FFRLF"]) |> Command.executer()

[grid_dimensions | robots] =
  IO.stream(:stdio, :line)
  |> Enum.take_while(&(&1 != "\n"))
  |> Enum.map(&String.replace(&1, "\n", ""))

grid_dimensions
|> Input.grid_size()

robots
|> Input.parse()
|> Command.executer()
