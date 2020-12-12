defmodule Aoc2020.Day06 do
  @spec part1([String.t()]) :: non_neg_integer()
  def part1(input) do
    input
    |> Enum.map(&count_by_groups(&1))
    |> Enum.sum()
  end

  defp count_by_groups(group) do
    group
    |> Enum.map(&passenger_to_set(&1))
    |> Enum.reduce(MapSet.new(), &MapSet.union(&2, &1))
    |> MapSet.size()
  end

  defp passenger_to_set(passenger) do
    passenger
    |> String.graphemes()
    |> Enum.reduce(MapSet.new(), &MapSet.put(&2, &1))
  end
end
