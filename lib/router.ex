defmodule PlugEx.Router do
  use Plug.Router
  #match our route and dispatch our code back
  plug :match
  plug :dispatch
  plug Plug.Static, at: "/home",from: :server

  get "/" do
    send_resp(conn,200,"Hey Theere!")
  end

  get "/about/:user_name" do
    send_resp(conn,200,"hello #{user_name}")
  end

  get "/home" do
    #conn = put_resp_content_type(conn,"type/html")
    #send_file(conn,200,"lib/index.html")
    conn
    |> put_resp_header("content-type", "text/html; charset=utf-8")
    |> Plug.Conn.send_file(200, "lib/index.html")
  end

  match _,do: send_resp(conn,404,"404 error not found!")

end
