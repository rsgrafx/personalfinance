defmodule PurchasesSupervisor do
  use Supervisor

  def start_link do 
    result = {:ok, sup} = :supervisor.start_link( __MODULE__, [])
    start_workers( sup )
    result
  end

  def start_workers( sup ) do 
    # Start the PurchaseData worker.
    {:ok, purchase_data_pid } = :supervisor.start_child( sup, worker( Core.PurchaseData, []))
    {:ok, purchase_repo_pid } = :supervisor.start_child( sup, worker( Core.PurchasesRepo, []))
    # Start Sub supervisor
    :supervisor.start_child( sup, worker(Core.PurchasesSupervisorSub, [ purchase_data_pid ]))
    :supervisor.start_child( sup, worker(Core.PurchasesSupervisorSub, [ purchase_repo_pid ]))
  end

  def init(_) do 
    supervise [], strategy: :one_for_one
  end
end