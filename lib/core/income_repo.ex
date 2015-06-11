defmodule Core.IncomeRepo do 
  use Ecto.Model

  schema "income" do 
    field :income_description
    field :schedule
    field :amount, :float, default: 100.00
    field :start_date
  end
end