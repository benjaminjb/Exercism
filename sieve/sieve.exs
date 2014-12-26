defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    Enum.to_list(2..limit)
    |> build_sieve([])
  end

  defp build_sieve([], acc), do: acc
  defp build_sieve(range, acc) do
    acc = Enum.concat(acc, [hd range])

    range
    |> Enum.reject(&(rem(&1, hd range)) == 0)
    |> build_sieve(acc)
  end

end
