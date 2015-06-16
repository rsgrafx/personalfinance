use Mix.Config
  config :banking, Core.BankingRepo,
    adapter: Ecto.Adapters.Postgres,
    database: "personal_banking_app",
    username: "root",
    password: ""