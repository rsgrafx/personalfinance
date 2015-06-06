defmodule ATMServerTest do
  use ExUnit.Case

  test "put some money in the account " do
    deposit = ATMServer.start_link([])
    assert :ok == ATMServer.deposit(deposit, :cash)
  end

  test "take some cash out from your account" do
    debit_pid = ATMServer.start_link([])
    ATMServer.deposit(debit_pid, :cash)
    assert {:ok, :cash } == ATMServer.withdraw(debit_pid, :cash)
  end

  test "you a broke bitch.. you dont have cash" do
    no_cash_pid = ATMServer.start_link([])
    ATMServer.deposit(no_cash_pid, :cash)
    assert {:ok, :cash} == ATMServer.withdraw(no_cash_pid, :cash)
    assert :no_cash == :gen_server.call(no_cash_pid, {:withdraw, :cash})
  end
end