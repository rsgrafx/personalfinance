defmodule ATMServerTest do
  use ExUnit.Case

  test "put some money in the account " do
    {:ok, deposit} = :gen_server.start_link( ATMServer, [],  [])
    assert :ok == :gen_server.call(deposit, {:deposit, :cash})
  end

  test "take some cash out from your account" do
    {:ok, withdraw} = :gen_server.start_link( ATMServer, [], [])
    :gen_server.call( withdraw, {:deposit, :cash})
    assert {:ok, :cash} == :gen_server.call(withdraw, {:withdraw, :cash})
  end

  test "you a broke bitch.. you dont have cash" do
    {:ok, no_cash_pid} = :gen_server.start_link(ATMServer, [], [])
    assert :no_cash == :gen_server.call(no_cash_pid, {:withdraw, :cash})
  end
end