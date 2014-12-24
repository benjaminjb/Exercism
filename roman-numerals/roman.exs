defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    number
    |> Integer.to_string
    |> String.graphemes
    |> transform
    |> Enum.join ""
  end

  defp transform(number_list) do
    number_list
    |> Enum.with_index
    |> Enum.map(fn({x, y}) -> 
      {x, length(number_list) - y}
      end)
    |> Enum.map(&transform_tuple(&1))
  end

  defp transform_tuple({num, pos}) when pos >= 1 and pos <= 4 do
    
    case pos do
      4 -> 
        char = "M"
      3 -> 
        upper = "M"
        half = "D"
        char = "C"
      2 -> 
        upper = "C"
        half = "L"
        char = "X"
      1 ->
        upper = "X"
        half = "V"
        char = "I"
    end

    cond do
      num in 1..3   ->
        String.duplicate(char, num)
      num == 4      ->
        "#{char}#{half}"
      num == 5      ->
        "#{half}"
      num in 6..8   ->
        "#{half}#{String.duplicate(char, num - 5)}"
      num == 9      ->
        "#{char}#{upper}"
      num == 0      ->
        ""
    end

  end

  defp transform_tuple({num, pos}), do: "That number is too large for the current function."
end
