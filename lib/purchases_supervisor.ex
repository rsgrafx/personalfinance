defmodule PurchasesSupervisor do
  use Supervisor

  def start_link do 
    :supervisor.start_link(__MODULE__, [])
  end

  def init(purchases) do 
    # child processes
    children = [worker(PurchasesServer, purchases)]
    supervise children, strategy: :one_for_one
  end
end