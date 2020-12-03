defmodule Aoc2020.Day01 do
  @year 2020

  @spec part1([non_neg_integer()]) :: non_neg_integer()
  def part1([number | tail]) do
    case Enum.find(tail, nil, &(number + &1 == @year)) do
      nil -> part1(tail)
      value -> number * value
    end
  end

  @spec part2([non_neg_integer()]) :: non_neg_integer()
  def part2([number | tail]) do
    case find_triplet(tail, @year - number) do
      nil -> part2(tail)
      value -> number * value
    end
  end

  defp find_triplet([], _current_sum), do: nil

  defp find_triplet([number_2 | tail], current_sum) do
    case Enum.find(tail, nil, &(&1 + number_2 == current_sum)) do
      nil -> find_triplet(tail, current_sum)
      value -> number_2 * value
    end
  end
end
