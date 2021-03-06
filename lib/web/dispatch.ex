defmodule Web.Dispatch do 
  def start do 
    dispatch = :cowboy_router.compile([ {:_, routes} ] )

    {:ok, _} = :cowboy.start_http(:personal_banking, 100, [{:port, 8090}],
    [{:env, [{:dispatch, dispatch}]}])
  end

  def routes do 
        [
          {"/websocket", Web.Realtime, []},
          {"/second_socket", Web.UploadUpdates, []},
          {:_, Plug.Adapters.Cowboy.Handler, { Web.AltApiRoutes, [] }},
          {"/[...]", :cowboy_static, { :priv_dir, :personal_banking, "", [{:mimetypes, :cow_mimetypes, :all}]}}
        ]
  end
end