defmodule InvengerWeb.FallbackController do
  use InvengerWeb, :controller

  def call(conn, {:error, %{result: result, status: status}}) do
    conn
    |> put_status(status)
    |> put_view(InvengerWeb.ErrorView)
    |> render("error.json", result: result)
  end
end
