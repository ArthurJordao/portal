defmodule Portal.Application do
    use Application
    def start(_app, _type) do
        DynamicSupervisor.start_link(
            strategy: :one_for_one,
            name: Portal.DoorSupervisor
        )
    end
end
