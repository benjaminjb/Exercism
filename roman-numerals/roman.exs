defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    number
    |> Integer.to_string
    |> String.graphemes
    |> Enum.reverse
    |> Enum.with_index
    |> Enum.map_join(&transform_tuple/1)
    |> String.reverse
  end

  defp transform_tuple({num, pos}) when pos >= 0 and pos <= 3 do
    case pos do
      3 -> 
        char = "M"
      2 -> 
        upper = "M"
        half = "D"
        char = "C"
      1 -> 
        upper = "C"
        half = "L"
        char = "X"
      0 ->
        upper = "X"
        half = "V"
        char = "I"
    end

    num = String.to_integer(num)
    cond do
      num in 1..3   ->
        String.duplicate(char, num)
      num == 4      ->
        "#{half}#{char}"
      num == 5      ->
        "#{half}"
      num in 6..8   ->
        "#{String.duplicate(char, num - 5)}#{half}"
      num == 9      ->
        "#{upper}#{char}"
      num == 0      ->
        ""
    end

  end

  defp transform_tuple({num, pos}), do: "That number is too large for the current function."
end
