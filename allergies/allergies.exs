defmodule Allergies do
  @doc """
  List the allergies for which the corresponding flag bit is true.

  Allergies should be ordered, starting with the allergie with the least
  significant bit ("eggs").
  """

@allergens [
  {128, "cats"},
  {64, "pollen"},
  {32, "chocolate"},
  {16, "tomatoes"},
  {8, "strawberries"},
  {4, "shellfish"},
  {2, "peanuts"},
  {1, "eggs"}
]

  @spec list(non_neg_integer) :: [String.t]
  def list(flags), do: _list(flags, [])

  defp _list(0, acc), do: Enum.uniq acc

  defp _list(flags, acc) do
    {score, allergen} = Enum.find(@allergens, 
      fn({sc, _}) -> sc <= flags 
    end)
    _list(flags - score, [allergen | acc])
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t) :: boolean
  def allergic_to?(flags, item) do
    Enum.member?(list(flags), item)
  end
end