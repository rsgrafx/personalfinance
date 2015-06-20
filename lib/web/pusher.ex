defmodule Web.Pusher do

  def send(msg) do 
    case msg do 
      { :message , _ , extracted_msg, _ } ->
        IO.puts( "#{inspect extracted_msg} :: RECEIVED ")
        extracted_msg |> pass_to_browser
      _ ->
    end
  end

  defp pass_to_browser(msg) do 
    result = Web.RealtimeServer.start_link
    case result do 
      {:error, {_, rpid}} -> rpid |> push_json(msg)
      {:ok, rpid } -> rpid |> push_json(msg)
      _ ->
    end
  end

  defp push_json(pid, msg) do 
    Web.RealtimeServer.send_updates(:uploads, pid, msg)
  end

end