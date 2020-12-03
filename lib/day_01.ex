defmodule Aoc2020.Day01 do
  @spec part1([non_neg_integer()]) :: non_neg_integer()
  def part1([number | tail]) do
    case Enum.find(tail, nil, &(number + &1 == 2020)) do
      nil -> part1(tail)
      value -> number * value
    end
  end
end
