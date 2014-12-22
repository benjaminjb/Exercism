defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"]}, "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(Dict.t) :: map() 
  def transform(input) do

    Enum.map(input, fn({key, value_list}) ->
      Enum.map(value_list, fn(value) ->
        Enum.into([String.downcase(value), key], %{})
      end)
    end)

  end
end
