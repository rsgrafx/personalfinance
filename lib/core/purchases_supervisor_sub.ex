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

defmodule Core.RedisSupervisorSub do
  @doc """
  This supervisor manages the Redis Supervisor application / process.
  """
  use Supervisor

  def start_link( pid ) do 
    :supervisor.start_link( __MODULE__, pid )
  end

  def init( pid ) do 
    child_prx = [ worker(Pubsub.Connection, [ pid ] ) ]
    supervise child_prx, strategy: :one_for_one
  end
end

defmodule Core.PostgresSupervisorSub do
  @doc """
  This supervisor manages the Postgres Supervisor application / process.
  """
  use Supervisor

  def start_link( pid ) do 
    :supervisor.start_link( __MODULE__, pid )
  end

  def init( pid ) do 
    child_prx = [ worker(Core.BankingRepo, [ pid ] ) ]
    supervise child_prx, strategy: :one_for_one
  end
end