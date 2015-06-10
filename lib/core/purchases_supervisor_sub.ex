defmodule Core.PurchasesSupervisorSub do
  use Supervisor

  def start_link(purchase_data_pid) do 
    :supervisor.start_link( __MODULE__, purchase_data_pid )
  end

  def init( purchase_data_pid ) do 
    child_prx = [ worker(PurchasesServer, [purchase_data_pid] ) ]
    supervise child_prx, strategy: :one_for_one
  end
end