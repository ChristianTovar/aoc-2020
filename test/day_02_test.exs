defmodule Aoc2020.Day02Test do
  use ExUnit.Case

  import Aoc2020.Day02

  setup_all do
    {:ok, input} = File.read("input/day_02.txt")

    {:ok, input: input}
  end

  test "part1", state do
    expected_result = 586
    assert expected_result == part1(state.input)
  end

  test "part2", state do
    expected_result = 352
    assert expected_result == part2(state.input)
  end
end
