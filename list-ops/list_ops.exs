defmodule ListOps do
  @spec count(list) :: non_neg_integer
  def count(l), do: _count(l, 0)

  defp _count([], acc), do: acc
  defp _count([_head | tail], acc) do
    _count(tail, acc + 1)
  end

  @spec reverse(list) :: list
  def reverse(l), do: _reverse(l, [])

  defp _reverse([], acc), do: acc
  defp _reverse([head | tail], acc) do
    _reverse(tail, [head | acc])
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: _map(l, f, [])

  defp _map([], _, acc), do: reverse(acc)
  defp _map([head | tail], f, acc) do
    _map(tail, f, [f.(head) | acc])
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: _filter(l, f, [])

  defp _filter([], _f, acc), do: reverse(acc)
  defp _filter([head | tail], f, acc) do
    case f.(head) do
      true    -> _filter(tail, f, [head | acc])
      false   -> _filter(tail, f, acc)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _f), do: acc
  def reduce([head | tail], acc, f) do
    reduce(tail, f.(head, acc), f)
  end

  @spec append(list, list) :: list
  def append([], b), do: b
  def append(a, []), do: a
  def append([head | tail], b) do
    [head|append(tail,b)]
  end

  @spec concat([[any]]) :: [any]
  def concat(ll), do: _concat(reverse(ll), [])

  defp _concat([], acc), do: acc
  defp _concat([h|t],acc), do: _concat(t,append(h,acc))

end