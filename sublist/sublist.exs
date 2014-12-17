defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b             ->  :equal
      contained_in?(a,b) ->  :sublist
      contained_in?(b,a) ->  :superlist
      true               ->  :unequal
    end
  end

  defp contained_in?([], _), do: true
  defp contained_in?(_, []), do: false

  defp contained_in?(contained, container) do
    if hd(contained) === hd(container) and Enum.take(container, length(contained)) === contained do
      true
    else
      contained_in?(contained, tl(container))
    end
  end
end

# Enum.drop_while([1,2,3,4,5,6,7,8,9,10], fn(x) -> x != 4 end) |> Enum.slice(0, length([4,5,6,7])) |> &(== [4,5,6,7])

  # def contained_in?(contained, container = [head | tail]) do
  #   if head === hd(contained) and 
  #   Enum.take(container, length(contained)) === contained do
  #     true
  #   else
  #     contained_in?(contained, tail)
  #   end
  # end