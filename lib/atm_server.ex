defmodule ATMServer do
  use GenServer

  def init(items) do
    {:ok, items}
  end

  def start_link do
    {:ok, item } = :gen_server.start_link( ATMServer, [], [] )
    item
  end

  # A part of GenServer Behaviour

  def handle_call({:deposit, item}, _from, items ) do
   {:reply, :ok, [item|items]}
  end

  def handle_call({:withdraw, item}, _from, items) do
    case Enum.member?(items, item) do
     true ->
      { :reply, {:ok, item} , List.delete(items, item) }
     false ->
      { :reply, :no_cash, items }
    end
  end

end