defmodule Aoc2020.Day06Test do
  use ExUnit.Case

  import Aoc2020.Day06

  setup_all do
    {:ok, input_string} = File.read("input/day_06.txt")

    input =
      input_string
      |> String.trim()
      |> String.split("\n\n")
      |> Enum.map(&String.split(&1, "\n"))

    {:ok, input: input}
  end

  test "part1", state do
    expected_result = 6259
    assert expected_result == part1(state.input)
  end
end
