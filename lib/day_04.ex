defmodule Aoc2020.Day04 do
  @spec part1([String.t()]) :: non_neg_integer()
  def part1(input) do
    input
    |> format_input()
    |> Enum.filter(&valid_passport?(&1))
    |> Enum.count()
  end

  @spec part2([String.t()]) :: non_neg_integer()
  def part2(input) do
    input
    |> format_input()
    |> Enum.filter(&real_valid_passport?(&1))
    |> Enum.count()
  end

  defp format_input(input) do
    input
    |> Enum.map(&String.split(&1))
    |> Enum.map(&string_list_to_map_list(&1))
  end

  defp string_list_to_map_list(list) do
    list
    |> Enum.map(&String.split(&1, ":"))
    |> Enum.map(fn [key, value] -> Map.new([{String.to_atom(key), value}]) end)
    |> Enum.reduce(%{}, &Map.merge(&1, &2))
  end

  defp valid_passport?(%{ecl: _, pid: _, eyr: _, hcl: _, byr: _, iyr: _, hgt: _}), do: true
  defp valid_passport?(_), do: false

  defp real_valid_passport?(%{
         ecl: ecl,
         pid: pid,
         eyr: eyr,
         hcl: hcl,
         byr: byr,
         iyr: iyr,
         hgt: hgt
       })
       when byr >= "1920" and byr <= "2002" and iyr >= "2010" and iyr <= "2020" and eyr >= "2020" and
              eyr <= "2030",
       do:
         valid_height?(hgt) and String.match?(hcl, ~r/^#[0-9a-f]{6}$/) and
           ecl in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"] and
           String.match?(pid, ~r/^[0-9]{9}$/)

  defp real_valid_passport?(_), do: false

  defp valid_height?(height) do
    value = String.slice(height, 0..-3)

    case String.replace(height, ~r/^[0-9]*/, "") do
      "cm" -> value >= "150" and value <= "193"
      "in" -> value >= "59" and value <= "76"
      _any -> false
    end
  end
end
