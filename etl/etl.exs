defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"]}, "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(Dict.t) :: map() 
  def transform(input) do
    Enum.reduce(input, %{}, fn({key, values}, acc) ->
      map = Enum.reduce(values, %{}, fn(val, val_acc) ->
        Map.put(val_acc, String.downcase(val), key)
      end)
      Map.merge(acc, map)
    end)
  end
end

