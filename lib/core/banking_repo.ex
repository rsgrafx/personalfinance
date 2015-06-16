defmodule Core.BankingRepo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres, otp_app: :banking

  def priv do 
    Application.app_dir(:banking, "priv/repo")
  end
end