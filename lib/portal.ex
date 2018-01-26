defmodule Portal do
  defstruct [:left, :right]

  # start_transfer(:blue, :orange, [1, 2, 3 ,4])
  def start_transfer(left, right, list) do
    for item <- list do
      Portal.Door.push(left, item)
    end
    %Portal{left: left, right: right}
  end

  def push_right(portal) do
    case Portal.Door.pop(portal.left) do
      {:ok, value} ->
        Portal.Door.push(portal.right, value)
      :error ->
        :error
    end
    portal
  end

  def shoot(color) do
    DynamicSupervisor.start_child(
      Portal.DoorSupervisor,
      {Portal.Door, color} # Portal.Door.start_link(color)
    )
  end

end

defimpl Inspect, for: Portal do
  def inspect(%Portal{left: left, right: right}, _opts) do
    left_door = inspect(left)
    right_door = inspect(right)
    left_data =
      left
      |> Portal.Door.get()
      |> Enum.reverse()
      |> Kernel.inspect()

    right_data =
      right
      |> Portal.Door.get()
      |> Kernel.inspect()
    
    max = max(String.length(left_data), String.length(left_door))

    """
    #Portal<
      #{String.pad_leading(left_door, max)} <=> #{right_door}
      #{String.pad_leading(left_data, max)} <=> #{right_data}
    >
    """
  end
end
