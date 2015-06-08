defmodule ManageDebtComponent do
  use GenServer

  def list_debt(entity) do 
    :gen_event.call(entity, ManageDebtComponent, :list_debt)
  end

  def init(debt) do 
    {:ok, debt}
  end

  def handle_event({:add_debt, debt_item}, debt) do 
    {:ok, debt ++ [debt_item]}
  end

  def handle_call(:list_debt, debt) do 
    { :ok, debt, debt }
  end
  
end