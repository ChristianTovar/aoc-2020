defmodule Aoc2020.Day04Test do
  use ExUnit.Case

  import Aoc2020.Day04

  setup_all do
    {:ok, input_string} = File.read("input/day_04.txt")

    input =
      input_string
      |> String.trim()
      |> String.split("\n\n")
      |> Enum.map(&String.replace(&1, "\n", " "))

    {:ok, input: input}
  end

  test "part1", state do
    expected_result = 226
    assert expected_result == part1(state.input)
  end

  test "part2", state do
    expected_result = 160
    assert expected_result == part2(state.input)
  end
end
