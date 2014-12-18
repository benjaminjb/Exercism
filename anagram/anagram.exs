defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    check_anagram(base, candidates, [])
  end

  def check_anagram(base, [], results) do 
    Enum.uniq results
    |> Enum.reverse
  end
  
  def check_anagram(base, [candidate_head | candidate_tail], results) do
    if separated_and_sorted(base) == separated_and_sorted(candidate_head) do
      check_anagram(base, candidate_tail, [candidate_head | results])
    else
      check_anagram(base, candidate_tail, results)
    end
  end

  defp separated_and_sorted(word) do
    Kernel.to_string(word)
    |> String.downcase
    |> String.graphemes
    |> Enum.sort
  end

end
