use Mix.Config
  config :banking, Core.BankingRepo,
    adapter: Ecto.Adapters.MySQL,
    database: "personal_banking_app",
    username: "root",
    password: ""