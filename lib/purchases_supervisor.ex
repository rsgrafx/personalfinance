defmodule PurchasesSupervisor do
  @doc """
  Main supervisor in the supervision tree - manages the * Core purchases data
  * and manages the Purchases Supervisor Sub.
  """
  use Supervisor

  def start_link do 
    result = {:ok, sup} = :supervisor.start_link( __MODULE__, [])
    start_workers( sup )
    result
  end

  def start_workers( sup ) do 
    # Start the PurchaseData worker.
    {:ok, purchase_data_pid } = :supervisor.start_child( sup, worker( Core.PurchaseData, []))
    {:ok, redis_connection_pid } = :supervisor.start_child( sup, worker( Pubsub.Connection, []))
    {:ok, postgres_pid} = :supervisor.start_child(sup, worker( Core.BankingRepo, []))
    
    # Start Sub supervisor * can manage more than one pid.
    :supervisor.start_child( sup, worker(Core.PurchasesSupervisorSub, [ purchase_data_pid]))
    :supervisor.start_child( sup, worker(Core.PurchasesSupervisorSub, [ redis_connection_pid ]))
    :supervisor.start_child( sup, worker(Core.PurchasesSupervisorSub, [ postgres_pid ]))
  end

  def init(_) do 
    supervise [], strategy: :one_for_one
  end
end