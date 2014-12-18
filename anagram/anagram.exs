defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter(candidates, &anagram_and_reject_same?(base, &1))
  end

  defp anagram_and_reject_same?(base, word) do
    String.downcase(base) != String.downcase(word) and sort(base) == sort(word)
  end

  defp sort(word) do
    word
    |> String.downcase
    |> String.graphemes
    |> Enum.sort
  end

end
