defmodule Core.BankingRepo do
  use Ecto.Repo, otp_app: :banking_db_app

  def priv do 
    :application.app_dir(:banking, "priv/repo")
  end
end