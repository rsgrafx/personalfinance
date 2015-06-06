defmodule BankingTest do
  use ExUnit.Case

  test "bank account starts with a 0 balance" do
    account = spawn_link( Banking, :start, [] )
    verify_balance_is 0, account
  end

  test "Amound incremented by amount of deposit" do
    account_pid = spawn_link(Banking, :start, [])
    send account_pid, { :deposit, 200 }
    verify_balance_is( 200, account_pid )
  end

  test "Withdrawals -- from balance" do
    account_pid = spawn_link(Banking, :start, [])
    send account_pid, { :deposit, 120 }
    send account_pid, { :withdrawal, 100 }
    verify_balance_is( 20, account_pid)
  end

  def verify_balance_is(expected_balance, account) do
    Process.send account , {:check_balance, self }, []
    assert_receive {:balance, ^expected_balance }
  end
end
