defmodule ATMServerTest do
  use ExUnit.Case

  test "put some money in the account " do
    deposit= ATMServer.start_link()
    assert :ok == :gen_server.call( deposit, {:deposit, :cash} )
  end

  test "take some cash out from your account" do
    withdraw = ATMServer.start_link()
    :gen_server.call( withdraw, {:deposit, :cash})
    assert {:ok, :cash} == :gen_server.call(withdraw, {:withdraw, :cash})
  end

  test "you a broke bitch.. you dont have cash" do
    no_cash_pid = ATMServer.start_link()
    assert :no_cash == :gen_server.call(no_cash_pid, {:withdraw, :cash})
  end
end