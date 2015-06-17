defmodule Db.Postgres do 
  @doc """
  This module - handles the read/writes to postgres
  """
  # import Ecto.Query, only: [from: 2]
  alias Models.PurchaseItem

  def save_message(msg) do 
    Core.BankingRepo.insert(msg)
  end

  # def messages_from(from) do 
  #   query = from m in Message, where: m.message_from = ^from
  #   Db.Repo.all(query)
  # end

  # def message_to(to) do 
  #   query = from m in Message, where: m.message_to = ^to
  #   Db.Repo.all(query)
  # end


end