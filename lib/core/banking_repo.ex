defmodule Core.BankingRepo do
  use Ecto.Repo, otp_app: :banking

  def priv do 
    Application.app_dir(:banking, "priv/repo")
  end
end