defmodule Aoc2020.Day05 do
  @spec part1([String.t()]) :: non_neg_integer()
  def part1(input) do
    input
    |> Enum.map(&decode_seat(&1))
    |> Enum.max()
  end

  @spec part2([String.t()]) :: non_neg_integer()
  def part2(input) do
    ids = Enum.map(input, &decode_seat(&1))
    min_id = Enum.min(ids)
    max_id = Enum.max(ids)

    min_id..max_id
    |> Enum.reject(&(&1 in ids))
    |> Enum.at(0)
  end

  defp decode_seat(letters) do
    row = Enum.slice(letters, 0..6)
    column = Enum.slice(letters, 7..9)

    calculate_seat(row, 0, 127) * 8 + calculate_seat(column, 0, 7)
  end

  defp calculate_seat([letter], min, _max) when letter in ~W(F L), do: min
  defp calculate_seat([letter], _min, max) when letter in ~W(B R), do: max

  defp calculate_seat([letter | tail], min, max) when letter in ~W(F L),
    do: calculate_seat(tail, min, lower_half(min, max))

  defp calculate_seat([letter | tail], min, max) when letter in ~W(B R),
    do: calculate_seat(tail, upper_half(min, max), max)

  def lower_half(min, max), do: Float.floor((min + max) / 2) |> trunc()
  def upper_half(min, max), do: Float.ceil((min + max) / 2) |> trunc()
end
