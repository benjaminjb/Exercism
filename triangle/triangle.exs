defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c) do
    [x, y, z] = Enum.sort [a, b, c]
    specify_kind(x, y, z)
  end

  def specify_kind(x, y, z) when x <= 0 or y <= 0 or z <= 0, do: { :error, "all side lengths must be positive" }
  def specify_kind(x, y, z) when (x + y) <= z, do: { :error, "side lengths violate triangle inequality" }
  def specify_kind(x, x, x), do: { :ok, :equilateral }
  def specify_kind(x, x, y), do: { :ok, :isosceles }
  def specify_kind(y, x, x), do: { :ok, :isosceles }
  def specify_kind(x, y, z), do: { :ok, :scalene }
end
