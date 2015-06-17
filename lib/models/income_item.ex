defmodule Models.IncomeItem do 
  use Ecto.Model

  schema "income" do 
    field :description
    field :schedule
    field :amount, :float, default: 100.00
    field :start_date
  end
end
