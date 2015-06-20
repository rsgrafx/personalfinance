defmodule Web.PageHandler do 

  def init(_transport, req, []) do 
    {:ok, req, nil}
  end

  def handle(req, state) do 
    {:ok, req} = :cowboy_req.chunked_reply(200, req)
    :ok = :cowboy_req.chunk("Root page text rendered by cowboy\r\n", req)
    {:ok, req, state}
  end

  def terminate(_reason, _req, _state), do: :ok
end