defmodule Core.PurchasesRepo do
  use Ecto.Model 

  schema "purchases" do
    field :item_description
    field :item_tags
    field :price, :float, default: 1.0
  end

end

defmodule Core.PurchaseItem do 
  defstruct [:item_description, :tags, :price]
end