defmodule Aoc2020.Day03 do

  @max_row_size 31
  @row_hop 3

  @spec part1([String.t()]) :: non_neg_integer()
  def part1(input), do: count_trees(input, 0, 0)

  defp count_trees([], _position, count), do: count

  defp count_trees([row_string | tail], position, count) do
    row = set_row(row_string, position)
    spot = Enum.at(row, position)
    updated_count = add_possible_tree(spot, count) 
    new_position = set_position(position)

    count_trees(tail, new_position, updated_count)
  end

  defp set_row(row_string, position) when position < @max_row_size, do: String.graphemes(row_string)
  defp set_row(row_string, _position), do: String.graphemes(row_string <> row_string)

  defp add_possible_tree(".", count), do: count
  defp add_possible_tree("#", count), do: count + 1

  defp set_position(position) when position < @max_row_size, do: position + @row_hop
  defp set_position(position), do: position + @row_hop - @max_row_size
 end
