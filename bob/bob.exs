defmodule Teenager do

  def hey(input) do
    str = String.strip (input)
    cond do
      str == "" -> "Fine. Be that way!"
      String.last(str) == "?" -> "Sure."
      String.upcase(str) == str and String.match?(str, ~r/\p{L}/) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end