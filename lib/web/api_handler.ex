defmodule Web.ApiHandler do 
  import Plug.Conn
  use Plug.Router
  use Plug.Builder

  plug Plug.Static, at: "/", from: :personal_banking
  
  if Mix.env == :dev do
    use Plug.Debugger
  end

  plug :match
  plug :dispatch
  # plug :not_found

  # Root path
  get "/js/:file" do 
    conn
    |> put_resp_header("content-type", "text/html")
    |> send_file(200, "priv/js/#{file}")
  end

  get "/css/:file" do 
    conn
    |> put_resp_header("content-type", "text/css")
    |> send_file(200, "priv/css/#{file}")
  end

  get "/fonts/:file" do 
    conn
    |> put_resp_header("content-type", "application/x-font-woff")
    |> send_file(200, "priv/fonts/#{file}")
  end
  
  get "/" do
    conn
    |> put_resp_header("content-type", "text/html")
    |> send_file(200, "priv/index.html")
  end

  forward "/api", to: Web.ApiRoutes

  def run do
    { :ok, _ } = Plug.Adapters.Cowboy.http Web.ApiHandler, []
  end

  def not_found(conn, _) do
    send_resp(conn, 404, "not found")
  end

end