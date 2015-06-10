defmodule PurchasesServer do

  use GenServer

  def start_link(purchase_data_pid) do 
    :gen_server.start_link({:local, :purchases}, __MODULE__, purchase_data_pid, [])
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

  def crash do 
    :gen_server.cast(:purchases, :crash)
  end

  # Gen server api.

  def init( purchase_data_pid ) do 
    purchases = Core.PurchaseData.get_state( purchase_data_pid )
    {:ok, { purchases, purchase_data_pid }}
  end

  def handle_cast(:crash, _blank_ ) do 
    1 = 2
  end

  def handle_cast(:clear, { _purchases, purchase_data_pid }) do 
    {:noreply, {[], purchase_data_pid}}
  end

  def handle_cast({:add,item}, {purchases, purchase_data_pid}) do 
    {:noreply , {purchases ++ [item], purchase_data_pid}}
  end

  def handle_cast({:remove, item}, {purchases, purchase_data_pid}) do 
    {:noreply, {List.delete(purchases, item), purchase_data_pid } }
  end

  def handle_call(:purchased_items, _from, { purchases, purchase_data_pid}) do 
    {:reply, purchases, {purchases, purchase_data_pid}}
  end

  def terminate(_reason, {purchases, purchase_data_pid}) do 
    Core.PurchaseData.save_state  purchase_data_pid, purchases
  end 

end