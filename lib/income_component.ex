defmodule IncomeComponent do
  use GenEvent

  def get_position(entity) do 
    :gen_event.call(entity, IncomeComponent, :get_position)
  end

  def list_income_streams(entity) do
    :gen_event.call(entity, IncomeComponent, :list_income_stream)
  end

  # Satisfy the api

  def init(position) do 
    {:ok, position }
  end

  def handle_call(_, position) do 
    {:ok, position, position}
  end

  def handle_event({:adjustment, {:y, new_y}}, {x, _}) do 
    {:ok, {x, new_y}}
  end

  def handle_event({:adjustment, {:x, new_x}}, {_, y}) do 
    {:ok, {new_x, y}}
  end

  def handle_event({:add_income_stream, income_item}, income) do 
    {:ok, income ++ [income_item] }
  end

  # def handle_call(:list_income_stream, income) do 
  #   {:ok, income, income}
  # end


end