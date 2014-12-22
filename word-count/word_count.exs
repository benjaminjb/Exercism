defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> prep 
    |> count_words
  end

  defp prep(sentence) do
    sentence
    |> String.replace(~r/([^\w-]|_)+/u, " ")
    |> String.downcase
    |> String.split
  end

  defp count_words(words) do
    Enum.reduce(words, Map.new, 
      fn(word, map) ->
        Map.update(map, word, 1, &(&1 + 1))
      end
    )
  end

end