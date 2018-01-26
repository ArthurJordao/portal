defmodule Portal.Stack do
  def new do
    []
  end

  def push(stack, value) do
    [value | stack]
  end

  def peek([head | _]) do
    {:ok, head}
  end

  def peek([]) do
    :error
  end
end
