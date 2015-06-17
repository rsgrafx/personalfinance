defmodule Models.PurchaseItem do
  use Ecto.Model 

  schema "purchases" do
    field :description
    field :tags
    field :amount, :float, default: 1.0
  end

end

# "CREATE TABLE IF NOT EXISTS purchases(id serial primary key, description text, tags text, amount double precision)"