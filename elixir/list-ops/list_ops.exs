defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    reduce(l, 0, fn(x,acc) -> acc+1 end)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reduce(l,[], fn(x,acc) -> [x|acc] end)
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    reduce(l, [], fn(x,acc) -> [f.(x)|acc] end)
    |> reverse
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do

  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    Enum.reduce(l,acc,f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    reduce(b, reverse(a), fn(x,acc) -> [x|acc] end)
    |> reverse
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reduce(ll, [], &append/2)
  end
end
