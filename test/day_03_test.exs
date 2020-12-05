defmodule Aoc2020.Day03Test do
  use ExUnit.Case

  import Aoc2020.Day03

  setup_all do
    {:ok, input_string} = File.read("input/day_03.txt")

    input =
      input_string
      |> String.trim()
      |> String.split("\n")

    {:ok, input: input}
  end

  test "part1", state do
    expected_result = 184
    assert expected_result == part1(state.input)
  end

  test "part2", state do
    expected_result = 2_431_272_960
    assert expected_result == part2(state.input)
  end
end
