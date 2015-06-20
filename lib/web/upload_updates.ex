defmodule Web.UploadUpdates do 

  @moduledoc """ 
    Secondary socket layer. This one will only push data to the browser - no input.
  """
  @behaviour :cowboy_websocket_handler

  def init({:tcp, :http}, _req, _opts), do: {:upgrade, :protocol, :cowboy_websocket }

  def websocket_init(_transport_name, req, _opts) do 
    Web.RealtimeServer.join(self())
    { :ok, req, :undefined_state }
  end

  # Implementation
  def websocket_handle(_data, req, state), do: {:ok, req, state}

  # This is the one that handles calls the server
  def websocket_info({:upload_update_message, _server_pid, msg}, req, state) do 
    {:reply, {:text, msg}, req, state}
  end

  def websocket_info( _info, req, state), do: {:ok, req, state }

  def websocket_terminate(_reason, _req, _state) do 
    Web.RealtimeServer.leave(self())
    :ok
  end

end