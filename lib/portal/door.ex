defmodule Portal.Door do
    use Agent, restart: :temporary

    def start_link(color) do
        Agent.start_link(fn -> [] end, name: color)
    end

    def push(color, value) do
        Agent.update(color, fn stack ->
            [value | stack]
        end)
    end

    def pop(color) do
        Agent.get_and_update(color, fn stack ->
            case stack do
                [head | tail] ->
                    get = {:ok, head}
                    update = tail
                    {get, update}
                [] ->
                    get = :error
                    update = []
                    {get, update}
            end
        end)
    end

    def get(color) do
        Agent.get(color, fn stack -> stack end)
    end

end