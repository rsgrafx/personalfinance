defmodule PurchasesServerTest do
  use ExUnit.Case

  setup do 
    PurchasesServer.clear
  end

  test "it should start out empty" do 
    assert PurchasesServer.items == []
  end

  test "lets you add items to list" do 
    date = Date.now
    PurchasesServer.add [%{:item => "T-Shirt on Amazon", cost: 15.99, :date => Date.local(date)}]
  end

  test "should clear every 7 days" do 

  end
end