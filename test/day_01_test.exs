defmodule Aoc2020.Day01Test do
  use ExUnit.Case

  import Aoc2020.Day01

  test "part1" do
    {:ok, input_string} = File.read("input/day_01.txt")

    input =
      input_string
      |> String.split()
      |> Enum.map(&String.to_integer(&1))

    expected_result = 870_331
    assert expected_result == part1(input)
  end
end
