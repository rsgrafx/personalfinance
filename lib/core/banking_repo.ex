defmodule Core.BankingRepo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres, otp_app: :personal_banking

  def priv do 
    Application.app_dir(:personal_banking, "priv/repo")
  end
end

# http://blog.drewolson.org/composable-queries-ecto/

# http://blog.drewolson.org/building-an-elixir-web-app/