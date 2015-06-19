defmodule ATMServer do
  @doc """
  This module only - writes to its own process state.
  """
  use GenServer

  def init(items) do
    {:ok, items}
  end

  def deposit(_pid, _item) do
    :gen_server.call( _pid, {:deposit, _item } )
  end

  def withdraw(_pid, _item) do
    :gen_server.call( _pid, {:withdraw, _item } )
  end

  def start_link(items) do
    {:ok, item } = :gen_server.start_link( __MODULE__, items, [] )
    item
  end

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