defmodule AccountHealthComponent do
  use GenEvent
  # public api

  def get_hp(entity) do 
    :gen_event.call(entity, AccountHealthComponent, :get_hp)
  end

  def alive?(entity) do 
    :gen_event.call(entity, AccountHealthComponent, :alive?)
  end

  # needs to satisfy GenEvent api.
  def init(hp) do 
    {:ok, hp}
  end

  def handle_event({:credithit, amount}, hp) do 
    {:ok, hp - amount}
  end

  def handle_event({:creditheal, amount}, hp) do 
    {:ok, hp + amount}
  end

  def handle_call(:get_hp, hp) do
    {:ok, hp, hp}
  end

  def handle_call(:alive?, hp) do 
    {:ok, hp > 0, hp}
  end

end