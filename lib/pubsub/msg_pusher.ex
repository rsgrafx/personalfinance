defmodule Pubsub.MsgPusher do
  @doc """
  This module captures the data from the original connection // Memory store -> Persistent Posgres
  # Expects json from redis 
  PUBLISH ocr_data '{"description" : "Sprouts grocesy store receipt", "item_tags" : "food, groceries", "price": "22.32"}'
  """
  def send(msg) do
    case msg do
      {:message, _, extracted_msg, _} ->
        IO.puts "#{log_time} [REDIS MESSGE] #{inspect msg}"
        extracted_msg |> convert_to_struct |> Db.Postgres.save_message
        IO.puts "#{log_time} [REDIS MESSGE] #{inspect extracted_msg}"
      _ -> # nada
    end
  end

  defp log_time do 
    {{year, month, day}, {hour, minute, second}} = :erlang.now |> :calendar.now_to_local_time
    "[#{year}/#{month}/#{day} #{hour}:#{minute}:#{second}]"
  end

  defp convert_to_struct(msg) do 
    Poison.decode!( msg , as: Models.PurchaseItem )
  end
end