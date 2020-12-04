defmodule Aoc2020.Day02 do
  use Bitwise

  @spec part1(String.t()) :: non_neg_integer()
  def part1(input_string) do
    input_string
    |> read_input()
    |> Enum.count(&valid_password?/1)
  end

  def part2(input_string) do
    input_string
    |> read_input()
    |> Enum.count(&real_valid_password?/1)
  end

  defp read_input(string) do
    string
    |> String.split("\n")
    |> Enum.map(&String.split(&1))
    |> Enum.drop(-1)
    |> Enum.map(fn [range, letter, string] -> [set_range(range), set_letter(letter), string] end)
  end

  defp set_range(range_string) do
    [min, max] = String.split(range_string, "-")
    {String.to_integer(min), String.to_integer(max)}
  end

  defp set_letter(letter_string), do: String.replace(letter_string, ":", "")

  defp valid_password?([{min, max}, letter, string]) do
    frequencies =
      string
      |> String.graphemes()
      |> Enum.frequencies()

    frequencies[letter] in min..max
  end

  defp real_valid_password?([{position_a, position_b}, letter, string]) do
    letters = String.graphemes(string)

    parse_position(letters, letter, position_a) ^^^ parse_position(letters, letter, position_b) ==
      1
  end

  defp parse_position(letters, letter, position) do
    case Enum.at(letters, position - 1) == letter do
      true -> 1
      false -> 0
    end
  end
end
