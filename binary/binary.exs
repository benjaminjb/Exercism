defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
 
    string
    |> String.graphemes
    |> transform_to_decimal(String.length(string) - 1, 0)

  end

  defp transform_to_decimal([], _list_length, acc), do: acc

  defp transform_to_decimal([head | tail], list_length, acc) do
    if String.match?(head, ~r/[01]/) do
      transform_to_decimal(tail, list_length - 1, acc + (:math.pow(2, list_length) * String.to_integer(head)))
    else
      0
    end
  end
end
