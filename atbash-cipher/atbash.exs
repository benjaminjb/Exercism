defmodule Atbash do
  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t) :: String.t
  def encode(plaintext) do
    plaintext
    |> String.downcase
    |> String.to_char_list
    |> Enum.map(&transform(&1))
    |> Enum.filter(&(&1 > 0))
    |> Enum.chunk(5, 5, [])
    |> Enum.join(" ")  
  end

  def transform(char) when char >= ?a and char <= ?z, do: (abs (char - ?z)) + ?a
  def transform(char) when char >= ?1 and char <= ?9, do: char
  def transform(_), do: 0
end
