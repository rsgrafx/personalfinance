defmodule Web.ApiRoutes do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/user/:name" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Core.BankingRepo.all(Models.PurchaseItem)
      |> Poison.encode!)
  end

end