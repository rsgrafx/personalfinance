defmodule AccountTest do
  use ExUnit.Case

  test "an account with a health component can be closed" do
    {:ok, entity } = Entity.init()
    Entity.add_component(entity, AccountHealthComponent, 100)
    assert AccountHealthComponent.get_hp(entity) == 100

    assert AccountHealthComponent.alive?( entity ) == true

    Entity.notify( entity, {:credithit, 50})
    assert AccountHealthComponent.get_hp(entity) == 50

    Entity.notify( entity, {:creditheal, 25} )
    assert AccountHealthComponent.get_hp(entity) == 75

    Entity.notify( entity, {:credithit, 75})
    assert AccountHealthComponent.alive?(entity) == false
  end

  test "An account level can fluctuate dependend on outside factors" do 
    {:ok, entity} = Entity.init()
    Entity.add_component(entity, IncomeComponent, {50, 50})
    Entity.notify(entity, {:adjustment, {:y, 35} })
    assert IncomeComponent.get_position(entity) == {50, 35 }

    Entity.notify(entity, {:adjustment, {:x, 10}})
    assert IncomeComponent.get_position(entity) == { 10, 35 }
  end

  test "Something with a Manage Debt Component can manage list of debts" do 
    {:ok, entity } = Entity.init()
    Entity.add_component(entity, ManageDebtComponent, [])
    Entity.notify(entity, { :add_debt, %{"Rent" => 900, :schedule => :monthly} })
    assert ManageDebtComponent.list_debt(entity) == [ %{"Rent" => 900, :schedule => :monthly} ]
    Entity.notify(entity, { :add_debt, %{"Mobile" => 50, :schedule => :monthly} })
    assert ManageDebtComponent.list_debt(entity) == [ %{"Rent" => 900, :schedule => :monthly}, %{"Mobile" => 50, :schedule => :monthly} ]
  end

  test "something with a Increase Income Component can manage monthly income streams " do 
    {:ok, entity } = Entity.init()
    Entity.add_component( entity, IncomeComponent, [])
    Entity.notify(entity, { :add_income_stream, %{"Salary" => 15000, :schedule => :monthly }})
    assert IncomeComponent.list_income_streams(entity) == [%{"Salary" => 15000, :schedule => :monthly}]
  end
end
