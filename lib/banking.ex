defmodule PersonalBanking do

  def start do
    await([])
  end

  def await(events) do
    receive do
     { :check_balance, pid } -> divulge_balance(pid, events)
     { :deposit, amount } -> events = deposit(amount, events)
     { :withdrawal, amount } -> events = withdraw(amount, events)
    end
    await(events)
  end

  def calculate_balance(events) do
    deposits = sum( just_deposits( events ) )
    withdrawals = sum( just_withdrawals( events) )
    deposits - withdrawals
  end

  def deposit(amount, events) do
    events ++ [{:deposit, amount}]
  end

  def withdraw(amount, events) do
    events ++ [{:withdraw, amount}]
  end

  def sum(events) do
    Enum.reduce(events, 0, fn({_, amount}, acc) -> acc + amount end)
  end

  def just_type(events, event_type) do
    Enum.filter(events, fn({type, _}) -> type == event_type end)
  end

  def just_deposits(events) do
    just_type(events, :deposit)
  end

  def just_withdrawals(events) do
    just_type(events, :withdraw)
  end

  def divulge_balance(_pid, events) do
    send _pid, { :balance, calculate_balance(events) }
  end

end
