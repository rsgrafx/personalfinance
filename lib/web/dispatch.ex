defmodule Web.Dispatch do 
  def start do 
    dispatch = :cowboy_router.compile([
      {:_,
        [
          {"/", Web.PageHandler, []},
          {"/websocket", Web.Realtime, []},
          {"/second_socket", Web.UploadUpdates, []},
          {"/[...]", :cowboy_static, { :priv_dir, :personal_banking, "", 
            [{:mimetypes, :cow_mimetypes, :all}]}}
          ]} ])

    {:ok, _} = :cowboy.start_http(:personal_banking, 100, [{:port, 8090}],
    [{:env, [{:dispatch, dispatch}]}]
      )
  end
end