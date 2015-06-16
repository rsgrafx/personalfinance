defmodule Core.PurchasesSupervisorSub do
  @doc """
  This supervisor manages the Purchases Supervisor application / process.
  """
  use Supervisor

  def start_link( pid ) do 
    :supervisor.start_link( __MODULE__, pid )
  end

  def init( pid ) do 
    child_prx = [ worker(PurchasesServer, [ pid ] ) ]
    supervise child_prx, strategy: :one_for_one
  end
end