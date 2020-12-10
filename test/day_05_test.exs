defmodule Aoc2020.Day05Test do
  use ExUnit.Case

  import Aoc2020.Day05

  setup_all do
    {:ok, input_string} = File.read("input/day_05.txt")

    input =
      input_string
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(&String.graphemes(&1))

    {:ok, input: input}
  end

  test "part1", state do
    expected_result = 913
    assert expected_result == part1(state.input)
  end
end
