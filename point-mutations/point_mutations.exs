defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) when length(strand1) == length(strand2) do
    Enum.zip(strand1,strand2)
    |> List.foldl(0, fn({x, y}, acc) -> 
      if x != y do
        acc + 1
      else
        acc
      end
    end)
  end

  def hamming_distance(_strand1, _strand2), do: nil
end
