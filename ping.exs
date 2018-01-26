{pid, ref} =
  spawn_monitor(fn ->
    receive do
      {:ping, sender} ->
        send(sender, :pong)
    end
  end)

send(pid, {:pang, self()})

receive do
  :pong ->
    IO.puts("acabou")
  {:DOWN, ^ref, _kind, _pid, _reason} ->
    IO.puts "Morreu :("
  after 1000 ->
    IO.puts "TIMEOUT"
end
