defmodule Aoc2020.Day04 do
  @spec part1([String.t()]) :: non_neg_integer()
  def part1(input) do
    input
    |> Enum.map(&String.split(&1))
    |> Enum.map(&string_list_to_map_list(&1))
    |> Enum.filter(&valid_passport?(&1))
    |> Enum.count()
  end

  defp string_list_to_map_list(list) do
    list
    |> Enum.map(&String.split(&1, ":"))
    |> Enum.map(fn [key, value] -> Map.new([{String.to_atom(key), value}]) end)
    |> Enum.reduce(%{}, &Map.merge(&1, &2))
  end

  defp valid_passport?(%{ecl: _, pid: _, eyr: _, hcl: _, byr: _, iyr: _, hgt: _}), do: true
  defp valid_passport?(_), do: false
end
