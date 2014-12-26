defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest. 
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    factor(number, 2, [])
  end

  defp factor(number, prime, factor_list) when number < prime, do: Enum.reverse(factor_list)
  
  defp factor(number, prime, factor_list) when rem(number, prime) == 0 do
    factor(div(number, prime), prime, [prime | factor_list])
  end

  defp factor(number, prime, factor_list) do
    factor(number, prime + 1, factor_list)
  end
end
