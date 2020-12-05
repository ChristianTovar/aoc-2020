defmodule Aoc2020.Day03 do
  @max_row_size 31

  @spec part1([String.t()]) :: non_neg_integer()
  def part1(input), do: count_trees(input, 3, 0, 0)

  @spec part2([String.t()]) :: non_neg_integer()
  def part2([h | t] = input) do
    fast_input = [h | Enum.drop_every(t, 2)]

    slope_1 = count_trees(input, 1, 0, 0)
    slope_2 = count_trees(input, 3, 0, 0)
    slope_3 = count_trees(input, 5, 0, 0)
    slope_4 = count_trees(input, 7, 0, 0)
    slope_5 = count_trees(fast_input, 1, 0, 0)

    slope_1 * slope_2 * slope_3 * slope_4 * slope_5
  end

  defp count_trees([], _row_hop, _position, count), do: count

  defp count_trees([row_string | tail], row_hop, position, count) do
    row = set_row(row_string, position)
    spot = Enum.at(row, position)
    updated_count = add_possible_tree(spot, count)
    new_position = set_position(row_hop, position)

    count_trees(tail, row_hop, new_position, updated_count)
  end

  defp set_row(row_string, position) when position < @max_row_size,
    do: String.graphemes(row_string)

  defp set_row(row_string, _position), do: String.graphemes(row_string <> row_string)

  defp add_possible_tree(".", count), do: count
  defp add_possible_tree("#", count), do: count + 1

  defp set_position(row_hop, position) when position < @max_row_size, do: position + row_hop
  defp set_position(row_hop, position), do: position + row_hop - @max_row_size
end
