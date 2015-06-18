defmodule Db.Postgres do 
  @doc """
  This module - handles the read/writes to postgres
  """
  import Ecto.Query, only: [from: 2]
  alias Models.PurchaseItem

  def save_message(msg) do 
    Core.BankingRepo.insert(msg)
  end

  def purchases_from(from) do 
    query = from m in Models.PurchaseItem, where: m.description == ^from
    Core.BankingRepo.all(query)
  end

  def cost_more_than(cost) do 
    query = from m in Models.PurchaseItem, where: m.amount >= ^cost
    Core.BankingRepo.all(query)
  end

end