use Mix.Config
  config :banking, Core.BankingRepo,
    adapter: Ecto.Adapters.Postgres,
    database: "personal_banking_income",
    username: "orionengleton",
    password: "",
    hostname: "127.0.0.1"
