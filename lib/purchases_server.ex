defmodule PurchasesServer do

  use GenServer

  def start_link do 
    :gen_server.start_link({:local, :purchases}, __MODULE__, [], [])
  end

  def clear do 
    :gen_server.cast(:purchases, :clear)
  end

  def add(item) do 
    :gen_server.cast(:purchases, {:add, item})
  end

  def remove(item) do 
    :gen_server.cast(:purchases, {:remove, item})
  end

  def purchases do 
    :gen_server.call(:purchases, :purchased_items)
  end

  # Gen server api.

  def init(purchases) do 
    {:ok, purchases}
  end

  def handle_cast(:clear, purchases) do 
    {:noreply, []}
  end

  def handle_cast({:add,item}, purchases) do 
    {:noreply , purchases ++ [item]}
  end

  def handle_cast({:remove, item}, purchases) do 
    {:noreply , List.delete(purchases, item) }
  end

  def handle_call(:purchased_items, _from, purchases) do 
    {:reply, purchases, purchases}
  end
end