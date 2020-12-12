defmodule Aoc2020.Day06 do
  @spec part1([String.t()]) :: non_neg_integer()
  def part1(input) do
    input
    |> Enum.map(&count_by_groups(&1, :anyone))
    |> Enum.sum()
  end

  @spec part2([String.t()]) :: non_neg_integer()
  def part2(input) do
    input
    |> Enum.map(&count_by_groups(&1, :everyone))
    |> Enum.sum()
  end

  defp count_by_groups(group, option) do
    group
    |> Enum.map(&passenger_to_set(&1))
    |> Enum.reduce(define_set(option))
    |> MapSet.size()
  end

  defp passenger_to_set(passenger) do
    passenger
    |> String.graphemes()
    |> Enum.reduce(MapSet.new(), &MapSet.put(&2, &1))
  end

  defp define_set(:anyone), do: &anyone/2
  defp define_set(:everyone), do: &everyone/2

  defp anyone(set_1, set_2), do: MapSet.union(set_1, set_2)

  defp everyone(set_1, set_2), do: MapSet.intersection(set_1, set_2)
end
