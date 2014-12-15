defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    prepped = prep(sentence)
    count_words(prepped, %{})
  end

  defp prep(sentence) do
    String.replace(sentence, ~r/_|[^\wö-]+/, " ")
    # String.replace(sentence, ~r/_|[^\p{L}ö\p{N}-]/, " ")
    # \x{F6} -- hex for ö
    |> String.downcase
    |> String.split
  end

  defp count_words([], acc), do: acc
  defp count_words([head | tail], acc) do
    quantity = Map.get(acc, head, 0)
    acc = Map.put(acc, head, quantity + 1)
    count_words(tail, acc)
  end

end