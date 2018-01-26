defmodule Portal.StackTest do
    use ExUnit.Case
    doctest Portal.Stack
    
    test "can push and pop to the stack" do
        stack = Portal.Stack.new
        stack = Portal.Stack.push(stack, 1)
        assert Portal.Stack.peek(stack) == {:ok, 1}
        
        stack = Portal.Stack.push(stack, 2)
        assert Portal.Stack.peek(stack) == {:ok, 2}
    end

    test "peek of an empty stack" do
        stack = Portal.Stack.new
        assert Portal.Stack.peek(stack) == :error
    end
  end
  