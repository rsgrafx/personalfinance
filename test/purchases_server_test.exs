defmodule PurchasesServerTest do
  use ExUnit.Case
  use Timex

  setup do 
    {:ok, pd_pid } = Core.PurchaseData.start_link
    PurchasesServer.start_link(pd_pid)
    PurchasesServer.clear
  end

  test "it should start out empty" do 
    assert PurchasesServer.purchases == []
  end

  test "lets you add items to list" do
    date_ = Date.local(Date.now)

    # IO.puts IO.inspect(date_)
    PurchasesServer.add %{ "TShirt" => 15.00, :date => date_ }
    assert PurchasesServer.purchases == [%{ "TShirt" => 15.00, :date => date_ }]
  end

  test "should clear every 7 days" do 
  end

end