defmodule Aoc2020.Day02 do
  @spec part1(String.t()) :: non_neg_integer()
  def part1(input_string) do
    input_string
    |> read_input()
    |> Enum.count(&valid_password?/1)
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
end
